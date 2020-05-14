Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 051511D3963
	for <lists+linux-ltp@lfdr.de>; Thu, 14 May 2020 20:49:55 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 80E953C545F
	for <lists+linux-ltp@lfdr.de>; Thu, 14 May 2020 20:49:54 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 036363C25E0
 for <ltp@lists.linux.it>; Thu, 14 May 2020 20:49:12 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id A39481A014FD
 for <ltp@lists.linux.it>; Thu, 14 May 2020 20:49:12 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B5B69AE0F
 for <ltp@lists.linux.it>; Thu, 14 May 2020 18:49:14 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Thu, 14 May 2020 20:49:00 +0200
Message-Id: <20200514184904.4537-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 0/4] Update installation docs
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

I updated installation docs. First motivation was to document pkgconf /
pkg-config related changes. But I also added a cleanup, because
instructions looked like 10+ years old.

I suppose there is nothing controversial with this patchset.

Kind regards,
Petr

Petr Vorel (4):
  INSTALL: Update requirements
  INSTALL: Document 32bit and cross-compilation setup
  INSTALL: Remove uClinux docs
  doc: Remove links to README.mk-devel

 INSTALL                 | 75 +++++++++++++++++++++--------------------
 README.md               |  5 +--
 include/mk/config.mk.in |  2 +-
 3 files changed, 43 insertions(+), 39 deletions(-)

-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
