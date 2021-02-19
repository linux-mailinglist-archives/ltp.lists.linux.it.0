Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BBF731FB2C
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Feb 2021 15:47:15 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CA0503C65C8
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Feb 2021 15:47:14 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id C80033C4F14
 for <ltp@lists.linux.it>; Fri, 19 Feb 2021 15:47:10 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 7B4BE601013
 for <ltp@lists.linux.it>; Fri, 19 Feb 2021 15:47:10 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id ABE3FABAE;
 Fri, 19 Feb 2021 14:47:09 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 19 Feb 2021 15:47:02 +0100
Message-Id: <20210219144704.20433-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 0/2] netns_netlink: Rewrite into new API
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

this is cleanup before needed fix of check_iproute().
More at second commit.

Kind regards,
Petr

Petr Vorel (1):
  libclone: Move test.h include to C file

Richard Palethorpe (1):
  netns_netlink: Rewrite into new API

 .../kernel/containers/libclone/libclone.c     |   1 +
 .../kernel/containers/libclone/libclone.h     |   1 -
 .../kernel/containers/mqns/mqns_helper.h      |   2 +-
 .../kernel/containers/netns/netns_helper.h    |  38 ++----
 .../kernel/containers/netns/netns_netlink.c   | 115 +++++++-----------
 5 files changed, 58 insertions(+), 99 deletions(-)

-- 
2.30.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
