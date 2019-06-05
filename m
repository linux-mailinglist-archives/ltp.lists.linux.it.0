Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C8735EDE
	for <lists+linux-ltp@lfdr.de>; Wed,  5 Jun 2019 16:16:17 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 22C853EA6E0
	for <lists+linux-ltp@lfdr.de>; Wed,  5 Jun 2019 16:16:17 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 4DBF83EA5C1
 for <ltp@lists.linux.it>; Wed,  5 Jun 2019 16:16:15 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id E3A4D601927
 for <ltp@lists.linux.it>; Wed,  5 Jun 2019 16:16:13 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 2EF44AFC7;
 Wed,  5 Jun 2019 14:16:13 +0000 (UTC)
Date: Wed, 5 Jun 2019 16:16:13 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <20190605141613.GA3965@dell5510>
References: <20190605072126.19856-1-pvorel@suse.cz>
 <20190605072126.19856-2-pvorel@suse.cz>
 <CAEemH2doAQ7=b-zutgHnY469rz-JThw0E_3b4o79zx+n2-uX_A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2doAQ7=b-zutgHnY469rz-JThw0E_3b4o79zx+n2-uX_A@mail.gmail.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Cc: LTP List <ltp@lists.linux.it>
Subject: Re: [LTP] [PATCH 2/2] inotify: Add SAFE_MYINOTIFY_ADD_WATCH() helper
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkgTGksCgp0aGFua3MgZm9yIHlvdXIgcmV2aWV3LgoKPiBJZiB0ZXN0IGV4aXQgd2l0aCBUQlJP
SyB0aGUgcmVhcF93ZCB3aWxsIG5ldmVyIGdldCBhIGNoYW5jZSB0byBzZXQgYXMgMSwKPiBhbmQg
dGhlIGNsZWFudXAoKSBhbHNvIG1ha2Ugbm8gc2Vuc2UgaW4gdHN0X2JyaygpIGNhbGxpbmcuCk5v
LCB0aGF0J3MgYSAiZmxhZyIgZm9yIGNsZWFudXAgZnVuY3Rpb24gd2hpY2ggaXMgcnVuIGFsd2F5
cyAobm8gbWF0dGVyIHdoZXRoZXIKdHN0X2JyaygpIHdhcyBjYWxsZWQpLiBTZWUgY2xlYW51cCgp
IGFuZCBtb3VudF9mbGFnIGluIFsxXS4KCj4gPiB3aXRoIHJlYXBfd2QgZGVmaW5lZCBpbiBpbm90
aWZ5LmggdGhlcmUgY291bGQgYmUgYWxzbwo+ID4gU0FGRV9NWUlOT1RJRllfUk1fV0FUQ0goKS4K
QW5kIG15IHN1Z2dlc3Rpb24gYWJvdmUgd2FzIHRvIGhhbmRsZSB0aGlzIGZsYWcgaW4gaW5vdGlm
eS5oLiBUaGFuIGl0J2QgbWFrZQpzZW5zZSB0byBhZGQgYWxzbyBTQUZFX01ZSU5PVElGWV9STV9X
QVRDSCgpLgoKS2luZCByZWdhcmRzLApQZXRyCgpbMV0gaHR0cHM6Ly9naXRodWIuY29tL2xpbnV4
LXRlc3QtcHJvamVjdC9sdHAvd2lraS9UZXN0LVdyaXRpbmctR3VpZGVsaW5lcyNhLXdvcmQtYWJv
dXQtdGhlLWNsZWFudXAtY2FsbGJhY2sKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9s
aXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
