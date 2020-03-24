Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id EC6ED190999
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Mar 2020 10:36:35 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B5CDB3C4D29
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Mar 2020 10:36:35 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id A28393C2312
 for <ltp@lists.linux.it>; Tue, 24 Mar 2020 10:36:34 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 1A45D20113C
 for <ltp@lists.linux.it>; Tue, 24 Mar 2020 10:36:33 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 516DEAD0B;
 Tue, 24 Mar 2020 09:36:33 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 24 Mar 2020 10:36:20 +0100
Message-Id: <20200324093622.21091-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 0/2] xinetd rewrite
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

Hi Alexey,

this sounds as a bad joke to rewrite tests for xinetd, which nobody uses
now. I was surprised, that it's still in some distros (e.g. openSUSE,
Debian, Gentoo). I can delete the test if we don't want LTP to be a
museum.

Kind regards,
Petr

Petr Vorel (2):
  xinetd: Rewrite into new API
  xinetd: Fix pattern for NetKit telnet

 testcases/network/xinetd/xinetd_tests.sh | 99 ++++++++----------------
 1 file changed, 33 insertions(+), 66 deletions(-)

-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
