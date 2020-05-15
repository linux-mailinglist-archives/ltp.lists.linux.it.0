Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E261D49A3
	for <lists+linux-ltp@lfdr.de>; Fri, 15 May 2020 11:32:31 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3BFA73C53BE
	for <lists+linux-ltp@lfdr.de>; Fri, 15 May 2020 11:32:31 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 4298D3C53A3
 for <ltp@lists.linux.it>; Fri, 15 May 2020 11:32:26 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 9EA5C601271
 for <ltp@lists.linux.it>; Fri, 15 May 2020 11:32:05 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id BCEEDB090;
 Fri, 15 May 2020 09:32:27 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 15 May 2020 11:32:12 +0200
Message-Id: <20200515093216.829-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v4 0/4] Update installation docs
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

changes v3->v4:
* improve note about other library dependencies in 1st commit (Jan)
* remove also "What's in a Path?" in 3rd commit

It'd need more cleanup, but enough now :).

Kind regards,
Petr

Petr Vorel (4):
  INSTALL: Update requirements, modernise text
  INSTALL: Document 32bit and cross-compilation setup
  INSTALL: Remove uClinux and "What's in a Path?" sections
  doc: Remove links to README.mk-devel

 INSTALL                 | 88 ++++++++++++++++-------------------------
 README.md               |  5 ++-
 include/mk/config.mk.in |  2 +-
 3 files changed, 38 insertions(+), 57 deletions(-)

-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
