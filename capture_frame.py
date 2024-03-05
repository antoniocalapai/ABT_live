import cv2

def capture_and_show_snapshot(camera_id=0):
    # Initialize the camera
    cap = cv2.VideoCapture(camera_id)

    # Check if the camera opened successfully
    if not cap.isOpened():
        print("Error: Could not open camera.")
        return

    # Capture a single frame
    ret, frame = cap.read()
    cap.release()  # Release the camera immediately after capturing the frame

    if ret:
        # Display the captured frame in a window
        cv2.imshow('Snapshot', frame)

        print("Snapshot taken and displayed. Press any key in the window to close.")

        # Wait for a key press and close the window
        cv2.waitKey(0)
        cv2.destroyAllWindows()
    else:
        print("Error: Could not capture frame.")

if __name__ == "__main__":
    capture_and_show_snapshot()
