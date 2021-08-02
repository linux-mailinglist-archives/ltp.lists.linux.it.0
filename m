Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B4EAA3DE7FA
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Aug 2021 10:10:13 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 069103C887F
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Aug 2021 10:10:13 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id CB2253C57C1
 for <ltp@lists.linux.it>; Mon,  2 Aug 2021 23:46:59 +0200 (CEST)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 71F8960005A
 for <ltp@lists.linux.it>; Mon,  2 Aug 2021 23:46:57 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: krisman) with ESMTPSA id 026AD1F42CC2
From: Gabriel Krisman Bertazi <krisman@collabora.com>
To: ltp@lists.linux.it,
	jack@suse.com,
	amir73il@gmail.com
Date: Mon,  2 Aug 2021 17:46:38 -0400
Message-Id: <20210802214645.2633028-1-krisman@collabora.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
X-Mailman-Approved-At: Tue, 03 Aug 2021 10:10:09 +0200
Subject: [LTP] [PATCH 0/7] Test the new fanotify FAN_FS_ERROR event
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Test Project <ltp.lists.linux.it>
List-Unsubscribe: <https://lists.linux.it/options/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=unsubscribe>
List-Archive: <http://lists.linux.it/pipermail/ltp/>
List-Post: <mailto:ltp@lists.linux.it>
List-Help: <mailto:ltp-request@lists.linux.it?subject=help>
List-Subscribe: <https://lists.linux.it/listinfo/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=subscribe>
Cc: Gabriel Krisman Bertazi <krisman@collabora.com>, linux-ext4@vger.kernel.org,
 kernel@collabora.com, khazhy@google.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

FAN_FS_ERROR is a new (still unmerged) fanotify event to monitor
fileystem errors.  This patchset introduces a new LTP test for this
feature.

Testing file system errors is slightly tricky, in particular because
they are mostly file system dependent.  Since there are only patches for
ext4, I choose to make the test around it, since there wouldn't be much
to do with other file systems.  The second challenge is how we cause the
file system errors, since there is no error injection for ext4 in Linux.
In this series, this is done by corrupting specific data in the
test device with the help of debugfs.

The FAN_FS_ERROR feature is flying around linux-ext4 and fsdevel, and
the latest version is available on the branch below:

    https://gitlab.collabora.com/krisman/linux -b fanotify-notifications-single-slot

A proper manpage description is also available on the respective mailing
list, or in the branch below:

    https://gitlab.collabora.com/krisman/man-pages.git -b fan-fs-error

Please, let me know your thoughts.

Gabriel Krisman Bertazi (7):
  syscalls/fanotify20: Introduce helpers for FAN_FS_ERROR test
  syscalls/fanotify20: Validate the generic error info
  syscalls/fanotify20: Validate incoming FID in FAN_FS_ERROR
  syscalls/fanotify20: Watch event after filesystem abort
  syscalls/fanotify20: Support submission of debugfs commands
  syscalls/fanotify20: Test file event with broken inode
  syscalls/fanotify20: Test capture of multiple errors

 testcases/kernel/syscalls/fanotify/.gitignore |   1 +
 .../kernel/syscalls/fanotify/fanotify20.c     | 328 ++++++++++++++++++
 2 files changed, 329 insertions(+)
 create mode 100644 testcases/kernel/syscalls/fanotify/fanotify20.c

-- 
2.32.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
