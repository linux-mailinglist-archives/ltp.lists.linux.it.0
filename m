Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D65373E9
	for <lists+linux-ltp@lfdr.de>; Thu,  6 Jun 2019 14:14:42 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D650A3EAA43
	for <lists+linux-ltp@lfdr.de>; Thu,  6 Jun 2019 14:14:41 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id CBB473EA9E8
 for <ltp@lists.linux.it>; Thu,  6 Jun 2019 14:14:38 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id C65BD1A013CA
 for <ltp@lists.linux.it>; Thu,  6 Jun 2019 14:14:37 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 349ABACD8
 for <ltp@lists.linux.it>; Thu,  6 Jun 2019 12:14:37 +0000 (UTC)
Date: Thu, 6 Jun 2019 14:14:36 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Christian Amann <camann@suse.com>
Message-ID: <20190606121436.GB27083@rei>
References: <20190604072228.17513-1-camann@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190604072228.17513-1-camann@suse.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH v2] syscalls/acct02: add functional testcase
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

SGkhCkhhdmUgeW91IHRyaWVkIHRoZSB0ZXN0IG9uIHRoZSAhdjMgY2FzZT8KCkkgZG8gaGF2ZToK
CkNPTkZJR19CU0RfUFJPQ0VTU19BQ0NUPXkKIyBDT05GSUdfQlNEX1BST0NFU1NfQUNDVF9WMyBp
cyBub3Qgc2V0CgpBbmQgdGhlIHRlc3QgZmFpbHMgd2l0aDoKCnRzdF9rY29uZmlnLmM6NjI6IElO
Rk86IFBhcnNpbmcga2VybmVsIGNvbmZpZyAnL3Byb2MvY29uZmlnLmd6Jwp0c3RfdGVzdC5jOjEx
MTE6IElORk86IFRpbWVvdXQgcGVyIHJ1biBpcyAwaCAwNW0gMDBzCnRzdF9rY29uZmlnLmM6NjI6
IElORk86IFBhcnNpbmcga2VybmVsIGNvbmZpZyAnL3Byb2MvY29uZmlnLmd6JwphY2N0MDIuYzox
NTk6IElORk86IFZlcmlmeWluZyB1c2luZyAnc3RydWN0IGFjY3QnCmFjY3QwMi5jOjEzNzogSU5G
TzogTnVtYmVyIG9mIGFjY291bnRpbmcgZmlsZSBlbnRyaWVzIHRlc3RlZDogMAphY2N0MDIuYzox
NDI6IEZBSUw6IGFjY3QoKSB3cm90ZSBpbmNvcnJlY3QgZmlsZSBjb250ZW50cyEKCkxvb2tzIGxp
a2UgdGhlIGZpbGUgaXMgZW1wdHkgZm9yIG1lLi4uCgotLSAKQ3lyaWwgSHJ1YmlzCmNocnViaXNA
c3VzZS5jegoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xp
c3RpbmZvL2x0cAo=
