Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E7563F43D6
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Aug 2021 05:22:19 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1DB0F3C5851
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Aug 2021 05:22:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 34BFD3C255A
 for <ltp@lists.linux.it>; Mon, 23 Aug 2021 05:22:15 +0200 (CEST)
Received: from ATCSQR.andestech.com (atcsqr.andestech.com [60.248.187.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id E3C87100044F
 for <ltp@lists.linux.it>; Mon, 23 Aug 2021 05:22:13 +0200 (CEST)
Received: from mail.andestech.com (atcpcs16.andestech.com [10.0.1.222])
 by ATCSQR.andestech.com with ESMTP id 17N3LPSo034190;
 Mon, 23 Aug 2021 11:21:25 +0800 (GMT-8)
 (envelope-from ycliang@andestech.com)
Received: from ubuntu02 (10.0.12.212) by ATCPCS16.andestech.com (10.0.1.222)
 with Microsoft SMTP Server id 14.3.498.0; Mon, 23 Aug 2021 11:21:26 +0800
Date: Mon, 23 Aug 2021 11:21:15 +0800
From: Leo Liang <ycliang@andestech.com>
To: <ltp@lists.linux.it>
Message-ID: <YSMUK+St5DsIf9O/@ubuntu02>
References: <20210804015053.GA21545@andestech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210804015053.GA21545@andestech.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Originating-IP: [10.0.12.212]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com 17N3LPSo034190
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v6,
 0/4] cgroup/cgroup_regression_test: Fix umount failure
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
Cc: richiejp@f-m.fm, ycliang@cs.nctu.edu.tw, alankao@andestech.com,
 metan@ucw.cz
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

A gentel ping.
If there's any modification needs to be made, please let me know.
Thanks!

Best regards,
Leo

On Wed, Aug 04, 2021 at 09:51:07AM +0800, Leo Liang wrote:
> The test sequence
> 	mount -t cgroup -o <controllers> <path>
> 	mkdir <path>/<dir>
> 	rmdir <path>/<dir>
> 	umount <path>
> 	mount -t cgroup -o <controllers> <path>
> would easily fail at the last mount with -EBUSY on certain platform.
> 
> Adding a little delay between "rmdir" and "umount" could fix the problem,
> so use tst_umount API instead of umount in "rmdir, umount" sequence.
> 
> tst_umount API is ambiguous when checking for whether a device is mounted.
> Modify it to check an actual mount point instead of device
> and reject anything that does not start with '/' as an argument.
> 
> Changes since v1
> - Use "tst_umount" instead of "sync" as suggested
> - Make "tst_umount" work with argument that has terminating slash
> 
> Changes since v2
> - Filter out the trailing slash instead of using mountpoint command
> 
> Changes since v3
> - Filter out the trailing slash only in grep command
> - Add comment in the test script
> 
> Changes since v4
> - Remove unnecessary stderr redirection
> 
> Changes since v5
> - Make tst_umount to only accept absolute mount point as an argument
> - Modify tests that use tst_umount to pass mount point in instead of device
> 
> Leo Yu-Chi Liang (4):
>   lib: tst_umount: umount a mount point instead of device
>   doc: change the default behavior of tst_umount
>   cgroup/cgroup_regression_test: Fix umount failure
>   Make argument to tst_umount an absolute path
> 
>  doc/shell-test-api.txt                         |  8 ++++----
>  .../cgroup/cgroup_regression_test.sh           | 10 +++++-----
>  .../fs/quota_remount/quota_remount_test01.sh   |  2 +-
>  .../integrity/ima/tests/evm_overlay.sh         |  2 +-
>  .../tracing/dynamic_debug/dynamic_debug01.sh   |  2 +-
>  testcases/lib/tst_test.sh                      | 18 +++++++++++-------
>  6 files changed, 23 insertions(+), 19 deletions(-)
> 
> -- 
> 2.17.0

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
