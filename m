Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 812B21C5AB0
	for <lists+linux-ltp@lfdr.de>; Tue,  5 May 2020 17:11:28 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4AC103C57F9
	for <lists+linux-ltp@lfdr.de>; Tue,  5 May 2020 17:11:28 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id A45083C265E
 for <ltp@lists.linux.it>; Tue,  5 May 2020 17:11:26 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 226D81400337
 for <ltp@lists.linux.it>; Tue,  5 May 2020 17:11:25 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E5DCDABB2;
 Tue,  5 May 2020 15:11:27 +0000 (UTC)
Date: Tue, 5 May 2020 17:11:23 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.de>
Message-ID: <20200505151123.GA9949@dell5510>
References: <20200505101625.25020-1-rpalethorpe@suse.com>
 <20200505133746.GB21884@dell5510>
 <87d07isaka.fsf@our.domain.is.not.set>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87d07isaka.fsf@our.domain.is.not.set>
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 1/2] pty04: Use guarded buffers for transmission
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Richard,

> This looks similar to the issue reported by Jan:

> https://github.com/linux-test-project/ltp/issues/674

> Is this the full output?

Here it is:

# ./pty04
tst_test.c:1244: INFO: Timeout per run is 0h 05m 00s
pty04.c:127: INFO: PTS path is /dev/pts/29
pty04.c:202: INFO: Netdev is sl0
pty04.c:211: INFO: Netdev MTU is 8192 (we set 8192)
pty04.c:228: INFO: Bound netdev 51 to socket 5
tst_buffers.c:55: INFO: Test is using guarded buffers
pty04.c:301: INFO: Reading from socket 5
tst_buffers.c:55: INFO: Test is using guarded buffers
pty04.c:176: PASS: Wrote PTY 1
pty04.c:186: PASS: Wrote PTY 2
pty04.c:305: PASS: Read netdev 1
pty04.c:309: PASS: Read netdev 2
pty04.c:315: PASS: Reading data from netdev interrupted by hangup
pty04.c:342: INFO: Sent hangup ioctl to PTS
pty04.c:191: PASS: Writing to PTY interrupted by hangup
pty04.c:344: INFO: Sent hangup ioctl to PTM
pty04.c:127: INFO: PTS path is /dev/pts/32
pty04.c:202: INFO: Netdev is slcan0
pty04.c:211: INFO: Netdev MTU is 16 (we set 16)
pty04.c:228: INFO: Bound netdev 52 to socket 8
tst_buffers.c:55: INFO: Test is using guarded buffers
pty04.c:301: INFO: Reading from socket 8
tst_buffers.c:55: INFO: Test is using guarded buffers
pty04.c:176: PASS: Wrote PTY 1
pty04.c:186: PASS: Wrote PTY 2
pty04.c:305: PASS: Read netdev 1
pty04.c:309: PASS: Read netdev 2
pty04.c:315: PASS: Reading data from netdev interrupted by hangup
pty04.c:342: INFO: Sent hangup ioctl to PTS
pty04.c:191: PASS: Writing to PTY interrupted by hangup
pty04.c:344: INFO: Sent hangup ioctl to PTM

Summary:
passed   12
failed   0
skipped  0
warnings 0

# ./pty04
tst_test.c:1244: INFO: Timeout per run is 0h 05m 00s
pty04.c:127: INFO: PTS path is /dev/pts/29
pty04.c:202: INFO: Netdev is sl0
pty04.c:211: INFO: Netdev MTU is 8192 (we set 8192)
pty04.c:228: INFO: Bound netdev 53 to socket 5
tst_buffers.c:55: INFO: Test is using guarded buffers
pty04.c:301: INFO: Reading from socket 5
tst_buffers.c:55: INFO: Test is using guarded buffers
pty04.c:176: PASS: Wrote PTY 1
pty04.c:186: PASS: Wrote PTY 2
pty04.c:305: PASS: Read netdev 1
# BLOCKS
tst_checkpoint.c:147: BROK: pty04.c:340: tst_checkpoint_wait(0, 10000): ETIMEDOUT (110)
tst_test.c:373: BROK: Reported by child (10018)
safe_macros.c:258: BROK: pty04.c:307: read(5,0x7f3920c4a001,8191) failed, returned -1: ENETDOWN (100)
pty04.c:191: PASS: Writing to PTY interrupted by hangup
tst_test.c:373: WARN: Reported by child (10016)

Summary:
passed   4
failed   0
skipped  0
warnings 1

It looked like it regularly changes working and failing, but sometimes it fails
several times. Also sometimes it works when -i2 (but mostly fails).

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
