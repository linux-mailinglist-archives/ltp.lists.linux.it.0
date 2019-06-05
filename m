Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FBBE35F64
	for <lists+linux-ltp@lfdr.de>; Wed,  5 Jun 2019 16:38:46 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 795A33EA706
	for <lists+linux-ltp@lfdr.de>; Wed,  5 Jun 2019 16:38:46 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id D80633EA68A
 for <ltp@lists.linux.it>; Wed,  5 Jun 2019 16:38:43 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 24EC86006DC
 for <ltp@lists.linux.it>; Wed,  5 Jun 2019 16:38:44 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id EE893ACAC
 for <ltp@lists.linux.it>; Wed,  5 Jun 2019 14:38:41 +0000 (UTC)
Date: Wed, 5 Jun 2019 16:38:41 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Cervinka <pcervinka@suse.com>
Message-ID: <20190605143841.GB25618@rei>
References: <20190604090824.15427-1-pcervinka@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190604090824.15427-1-pcervinka@suse.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH v2] Fix shebang in open-posix makefile generator
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.18
Precedence: list
List-Id: Linux Test Project <ltp.lists.linux.it>
List-Unsubscribe: <https://lists.linux.it/options/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=unsubscribe>
List-Archive: <http://lists.linux.it/pipermail/ltp/>
List-Post: <mailto:ltp@lists.linux.it>
List-Help: <mailto:ltp-request@lists.linux.it?subject=help>
List-Subscribe: <https://lists.linux.it/listinfo/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkhCgpZb3UgYXJlIG1pc3NpbmcgdGhlIFNpZ25lZC1vZmYtYnk6IGxpbmUgaGVyZSwgc2VlOgoK
aHR0cHM6Ly93d3cua2VybmVsLm9yZy9kb2MvaHRtbC9sYXRlc3QvcHJvY2Vzcy9zdWJtaXR0aW5n
LXBhdGNoZXMuaHRtbCNzaWduLXlvdXItd29yay10aGUtZGV2ZWxvcGVyLXMtY2VydGlmaWNhdGUt
b2Ytb3JpZ2luCgpPdGhlciB0aGFuIHRoYXQgdGhpcyBpcyBvYnZpb3VzbHkgT0suCgotLSAKQ3ly
aWwgSHJ1YmlzCmNocnViaXNAc3VzZS5jegoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczov
L2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
