Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D08532F9FD4
	for <lists+linux-ltp@lfdr.de>; Mon, 18 Jan 2021 13:35:02 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 708A53C5FA9
	for <lists+linux-ltp@lfdr.de>; Mon, 18 Jan 2021 13:35:02 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 4D3013C2306
 for <ltp@lists.linux.it>; Mon, 18 Jan 2021 13:34:42 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id D6D246009FD
 for <ltp@lists.linux.it>; Mon, 18 Jan 2021 13:34:41 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1C82EACBA;
 Mon, 18 Jan 2021 12:34:41 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Mon, 18 Jan 2021 13:34:31 +0100
Message-Id: <20210118123433.17071-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [RFC PATCH 0/2] kernel module detection (own implementation)
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
Cc: Steve Muckle <smuckle@google.com>, Sandeep Patil <sspatil@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

pre-release fix for BusyBox. It depends on modules.dep.

This implementation fails to detect built-in modules. IMHO the only
option is to run modprobe -n or modinfo from kmod:

$ modprobe -n aead; echo $?
0

$ modinfo aead
name:           aead
filename:       (builtin)
description:    Authenticated Encryption with Associated Data (AEAD)
license:        GPL
file:           crypto/aead

kmod implementation searches in /lib/modules/$(uname -r)/modules.builtin.modinfo,
thus I'll have look at that /lib/modules/$(uname -r)/modules.builtin.

But maybe we should just search for module in /lib/modules/$(uname -r)
(/system/lib/modules for android) instead expecting modules.dep + check
content of modules.builtin for built-in if file available.

@Sandeep @Steve: could you have a quick look on Android part?
Not sure if modules.dep (and modules.builtin) is available at all on AOSP.

Kind regards,
Petr

Petr Vorel (2):
  lib: Fix kernel module detection on BusyBox
  zram: Fix module detection on BusyBox

 lib/tst_kernel.c                              | 63 +++++++++++++++++--
 .../kernel/device-drivers/zram/zram_lib.sh    |  6 +-
 2 files changed, 60 insertions(+), 9 deletions(-)

-- 
2.29.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
