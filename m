Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD06C2043
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Sep 2019 13:59:04 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 08F0E3C2301
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Sep 2019 13:59:04 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id CDB2E3C0374
 for <ltp@lists.linux.it>; Mon, 30 Sep 2019 13:58:59 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id D776A1401134
 for <ltp@lists.linux.it>; Mon, 30 Sep 2019 13:58:58 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 016D5ABB1
 for <ltp@lists.linux.it>; Mon, 30 Sep 2019 11:58:57 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Mon, 30 Sep 2019 13:58:50 +0200
Message-Id: <20190930115852.21672-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [RFC PATCH 0/2] Update user related docs
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

this is far from being perfect, it's a stub, but better start so one day
it's perfect :).
IMHO the direction should be to have a few high level files with more
content than many files with specific content (that's why merge
colorized-output.txt). doc/user-guide.txt should be added to wiki and
being synced.

See also other patches touching docs [1], [2].

Comments are more then welcome.

Kind regards,
Petr

[1] https://patchwork.ozlabs.org/patch/1166786/
[2] https://patchwork.ozlabs.org/patch/1151766/

Petr Vorel (2):
  doc: Removed outdated ltp-howto.{txt,lyx}
  doc: Add user-guide.txt

 README.md                |   4 +-
 doc/colorized-output.txt |  10 -
 doc/ltp-howto.lyx        | 978 ---------------------------------------
 doc/ltp-howto.txt        | 488 -------------------
 doc/user-guide.txt       |  29 ++
 5 files changed, 32 insertions(+), 1477 deletions(-)
 delete mode 100644 doc/colorized-output.txt
 delete mode 100644 doc/ltp-howto.lyx
 delete mode 100644 doc/ltp-howto.txt
 create mode 100644 doc/user-guide.txt

-- 
2.23.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
