import time
import logging
from auto_investment import setup_schedule

logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')
logger = logging.getLogger('scheduler-runner')

if __name__ == '__main__':
    logger.info('启动独立定投调度器')
    setup_schedule()
    try:
        while True:
            time.sleep(60)
    except KeyboardInterrupt:
        logger.info('调度器已停止')
