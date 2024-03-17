#include <iostream>
#include <chrono>
#include <vector>
#include <algorithm>
#include "olcConsoleGameEngine.h"
using namespace std;



class OneLoneCoder_UltimateFPS : public olcConsoleGameEngine {
public:
	OneLoneCoder_UltimateFPS() {
		m_sAppName = L"Ultimate First Person Shooter";
	}

	virtual bool OnUserCreate() {
		map += L"################";
		map += L"#..............#";
		map += L"#..............#";
		map += L"#...........#..#";
		map += L"#..............#";
		map += L"#.......#......#";
		map += L"#..............#";
		map += L"#..............#";
		map += L"#..............#";
		map += L"#..#...........#";
		map += L"#..............#";
		map += L"#..............#";
		map += L"#.......########";
		map += L"#..............#";
		map += L"#..............#";
		map += L"################";
	}

	virtual bool OnUserUpdate(float fElapsedTime) {
		// Controls
		// Handle CCW Rotation
		if (m_keys[L'A'].bHeld) {
			fPlayerA -= (0.8f) * fElapsedTime;
		}

		if (m_keys[L'D'].bHeld) {
			fPlayerA += (0.8f) * fElapsedTime;
		}

		if (m_keys[L'W'].bHeld) {
			fPlayerX += sinf(fPlayerA) * 5.0f * fElapsedTime;
			fPlayerY += cosf(fPlayerA) * 5.0f * fElapsedTime;

			if (map[(int)fPlayerY * nMapWidth + (int)fPlayerX] == '#') {
				fPlayerX -= sinf(fPlayerA) * 5.0f * fElapsedTime;
				fPlayerY -= cosf(fPlayerA) * 5.0f * fElapsedTime;
			}
		}

		if (m_keys[L'S'].bHeld) {
			fPlayerX -= sinf(fPlayerA) * 5.0f * fElapsedTime;
			fPlayerY -= cosf(fPlayerA) * 5.0f * fElapsedTime;

			if (map[(int)fPlayerY * nMapWidth + (int)fPlayerX] == '#') {
				fPlayerX += sinf(fPlayerA) * 5.0f * fElapsedTime;
				fPlayerY += cosf(fPlayerA) * 5.0f * fElapsedTime;
			}
		}

		for (int x = 0; x < ScreenWidth(); x++) {
			// For each column, calculate the projected ray angle into world space
			float fRayAngle = (fPlayerA - fFOV / 2.0f) + ((float)x / (float)ScreenWidth()) * fFOV;

			float fDistanceToWall = 0;
			bool bHitWall = false;
			bool bBoundary = false;

			float fEyeX = sinf(fRayAngle); // Unit vector for ray in player space
			float fEyeY = cosf(fRayAngle);

			while (!bHitWall && fDistanceToWall < fDepth) {

				fDistanceToWall += 0.1f;

				int nTestX = (int)(fPlayerX + fEyeX * fDistanceToWall);
				int nTestY = (int)(fPlayerY + fEyeY * fDistanceToWall);

				// Test if ray is out of bounds
				if (nTestX < 0 || nTestX >= nMapWidth || nTestY < 0 || nTestY >= nMapHeight) {
					bHitWall = true; // Just set distance to maximum depth
					fDistanceToWall = fDepth;
				}
				else {
					// Ray is inbounds so test to see if the ray cell is a wall block
					if (map[nTestY * nMapWidth + nTestX] == '#') {
						bHitWall = true;

						vector<pair<float, float>> p; // distance, dot

						for (int tx = 0; tx < 2; tx++) {
							for (int ty = 0; ty < 2; ty++) {
								float vy = (float)nTestY + ty - fPlayerY;
								float vx = (float)nTestX + tx - fPlayerX;
								float d = sqrt(vx * vx + vy * vy);
								float dot = (fEyeX * vx / d) + (fEyeY * vy / d);
								p.push_back(make_pair(d, dot));
							}
							// Sort Pairs from closest to farthest
							sort(p.begin(), p.end(), [](const pair<float, float>& left, const pair <float, float>& right) {return left.first < right.first; });

							float fBound = 0.01f;
							if (acos(p.at(0).second) < fBound) bBoundary = true;
							if (acos(p.at(1).second) < fBound) bBoundary = true;
						}
					}
				}
			}

			// Calculate distance to ceiling and floor
			int nCeiling = (float)(ScreenHeight() / 2.0) - ScreenHeight() / ((float)fDistanceToWall);
			int nFloor = ScreenHeight() - nCeiling;

			short nShade = ' ';

			if (fDistanceToWall <= fDepth / 4.0f)	  nShade = 0x2588;  // Very close
			else if (fDistanceToWall < fDepth / 3.0f) nShade = 0x2593;
			else if (fDistanceToWall < fDepth / 2.0f) nShade = 0x2592;
			else if (fDistanceToWall < fDepth)		  nShade = 0x2591;
			else                                      nShade = ' ';		// Too far away

			if (bBoundary)				nShade = ' '; // Black is out

			for (int y = 0; y < ScreenHeight(); y++) {
				if (y <= nCeiling) {
					screen[y * ScreenWidth() + x] = ' ';
				}
				else if (y > nCeiling && y <= nFloor) {
					screen[y * ScreenWidth() + x] = nShade;
				}
				else {
					// Shade floor based on distance
					float b = 1.0f - (((float)y - ScreenHeight() / 2.0f) / ((float)ScreenHeight() / 2.0f));
					if (b < 0.25)		nShade = '#';
					else if (b < 0.5)	nShade = 'x';
					else if (b < 0.75)	nShade = '.';
					else if (b < 0.9)	nShade = '-';
					else                nShade = ' ';
					screen[y * ScreenWidth() + x] = nShade;
				}
			}
		}

		// Display Stats
		swprintf_s(screen, 40, L"X=%3.2f, Y=%3.2f, A=%3.2f, FPS=%3.2f ", fPlayerX, fPlayerY, fPlayerA, 1.0f / fElapsedTime);

		// Display Map
		for (int nx = 0; nx < nMapWidth; nx++) {
			for (int ny = 0; ny < nMapWidth; ny++) {
				screen[(ny + 1) * ScreenWidth() + nx] = map[ny * nMapWidth + nx];
			}
		}

		screen[((int)fPlayerY + 1) * ScreenWidth() + (int)fPlayerX] = 'P';

		// Write to the screen
		screen[ScreenWidth() * ScreenHeight() - 1] = '\0';
		WriteConsoleOutputCharacter(hConsole, screen, ScreenHeight() * ScreenWidth(), { 0,0 }, &dwBytesWritten); // Coordinates
		//


	}


private:

	float fPlayerX = 8.0f;
	float fPlayerY = 8.0f;
	float fPlayerA = 0.0f;
	wstring map;
	int nMapHeight = 16;
	int nMapWidth = 16;

	float fFOV = 3.14159565 / 4.0;
	float fDepth = 16.0f;
	float fSpeed = 5.0f;
};

int main() {

}