Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C4BA643B9CB
	for <lists+linux-ltp@lfdr.de>; Tue, 26 Oct 2021 20:43:18 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 24E413C6857
	for <lists+linux-ltp@lfdr.de>; Tue, 26 Oct 2021 20:43:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 6B6573C67DE
 for <ltp@lists.linux.it>; Tue, 26 Oct 2021 20:43:14 +0200 (CEST)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 0D2721001588
 for <ltp@lists.linux.it>; Tue, 26 Oct 2021 20:43:12 +0200 (CEST)
Received: from localhost (unknown [IPv6:2804:14c:124:8a08::1002])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: krisman)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 035A51F43877;
 Tue, 26 Oct 2021 19:43:10 +0100 (BST)
From: Gabriel Krisman Bertazi <krisman@collabora.com>
To: ltp@lists.linux.it,
	jack@suse.com,
	amir73il@gmail.com
Date: Tue, 26 Oct 2021 15:42:29 -0300
Message-Id: <20211026184239.151156-1-krisman@collabora.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v2 00/10] Test the new fanotify FAN_FS_ERROR event
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
Cc: linux-ext4@vger.kernel.org, kernel@collabora.com,
 Gabriel Krisman Bertazi <krisman@collabora.com>, khazhy@google.com,
 repnop@google.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

Now that FAN_FS_ERROR is close to being merged, I'm sending out a new
version of the LTP tests.  This version only applies the previous
feedback and updates the interface to correspond to the changes
requested on the kernel patches.

One important detail is that, for the tests to succeed, there is a
dependency on an ext4 fix I sent today:

https://lore.kernel.org/linux-ext4/20211026173302.84000-1-krisman@collabora.com/T/#u

---

Original cover letter:

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

    https://gitlab.collabora.com/krisman/linux -b fanotify-notifications-v9

A proper manpage description is also available on the respective mailing
list, or in the branch below:

    https://gitlab.collabora.com/krisman/man-pages.git -b fan-fs-error

Please, let me know your thoughts.

Gabriel Krisman Bertazi (10):
  syscalls: fanotify: Add macro to require specific mark types
  syscalls: fanotify: Add macro to require specific events
  syscalls/fanotify20: Introduce helpers for FAN_FS_ERROR test
  syscalls/fanotify20: Validate the generic error info
  syscalls/fanotify20: Validate incoming FID in FAN_FS_ERROR
  syscalls/fanotify20: Support submission of debugfs commands
  syscalls/fanotify20: Create a corrupted file
  syscalls/fanotify20: Test event after filesystem abort
  syscalls/fanotify20: Test file event with broken inode
  syscalls/fanotify20: Test capture of multiple errors

 testcases/kernel/syscalls/fanotify/.gitignore |   1 +
 testcases/kernel/syscalls/fanotify/fanotify.h |  72 +++-
 .../kernel/syscalls/fanotify/fanotify03.c     |   4 +-
 .../kernel/syscalls/fanotify/fanotify10.c     |   3 +-
 .../kernel/syscalls/fanotify/fanotify12.c     |   3 +-
 .../kernel/syscalls/fanotify/fanotify20.c     | 313 ++++++++++++++++++
 6 files changed, 389 insertions(+), 7 deletions(-)
 create mode 100644 testcases/kernel/syscalls/fanotify/fanotify20.c

-- 
2.33.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
