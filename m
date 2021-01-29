Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E0C43088FF
	for <lists+linux-ltp@lfdr.de>; Fri, 29 Jan 2021 13:18:51 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1CB963C3051
	for <lists+linux-ltp@lfdr.de>; Fri, 29 Jan 2021 13:18:51 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id E52D23C2F7A
 for <ltp@lists.linux.it>; Fri, 29 Jan 2021 13:18:28 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 48BE260074A
 for <ltp@lists.linux.it>; Fri, 29 Jan 2021 13:18:28 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 57C00AC41;
 Fri, 29 Jan 2021 12:18:27 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 29 Jan 2021 13:18:12 +0100
Message-Id: <20210129121817.12563-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 0/5] zram cleanup
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

this is a cleanup which began as
https://patchwork.ozlabs.org/project/ltp/patch/20210114183226.794-1-pvorel@suse.cz/

More TODO:
* sometimes timeout on zram01, when all 4 filesystems are supported.
Maybe simple LTP_TIMEOUT_MUL=$dev_num
or LTP_TIMEOUT_MUL=$((dev_num/2)) # will be 2 only for 4 filesystems

* -i parameter does not work
If we want to even bother (maybe somebody would like to stress zram
using -i), the problem is: that zram_load() and zram_cleanup() are
setup/cleanup functions, but would have to be called for each iteration.

To fix this I can change them to be normal test functions and
zram_cleanup() also a cleanup function. But it's not a first time when I
miss in our API setup and cleanup to be run in each iteration
(.setup_iterations = foo, TST_SETUP_ITERATIONS=foo).

* maybe move section with checking /proc/meminfo to setup as well?

Kind regards,
Petr

Petr Vorel (5):
  zram: Require root
  zram: Calculate dev_num variable
  zram01.sh: Check properly mkfs.* dependencies
  zram: Move zram_compress_alg() to zram02.sh
  zram: Move test specific functions out of zram_lib.sh

 .../kernel/device-drivers/zram/zram01.sh      |  99 ++++++++++++++--
 .../kernel/device-drivers/zram/zram02.sh      |  77 ++++++++++--
 .../kernel/device-drivers/zram/zram_lib.sh    | 111 +++---------------
 3 files changed, 168 insertions(+), 119 deletions(-)

-- 
2.30.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
