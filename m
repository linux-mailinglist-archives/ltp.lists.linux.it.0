Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3FA47D8E
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Jun 2019 10:50:44 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A8CB33EB0DE
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Jun 2019 10:50:44 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 623893EA43A
 for <ltp@lists.linux.it>; Mon, 17 Jun 2019 10:50:42 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 9751A2010FC
 for <ltp@lists.linux.it>; Mon, 17 Jun 2019 10:50:41 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 13968AFC3;
 Mon, 17 Jun 2019 08:50:40 +0000 (UTC)
Date: Mon, 17 Jun 2019 10:50:39 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Jan Stancek <jstancek@redhat.com>
Message-ID: <20190617085039.GA1629@rei.lan>
References: <adca7c08dbf20805da9b99a7fa03d498de70235d.1560410182.git.jstancek@redhat.com>
 <1b6ddab9cd8e3620da9e37b1132e911280c22e32.1560410182.git.jstancek@redhat.com>
 <CAEemH2frt_zGSdSRL3d_J+km74p8ruQTNF6bVhEpaiTdMLCC6A@mail.gmail.com>
 <1320546599.27920597.1560420988025.JavaMail.zimbra@redhat.com>
 <20190613141714.GC29926@rei.lan>
 <1211798607.28016198.1560437855198.JavaMail.zimbra@redhat.com>
 <20190613151419.GE29926@rei.lan>
 <151498464.28356667.1560670442630.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <151498464.28356667.1560670442630.JavaMail.zimbra@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Cc: LTP List <ltp@lists.linux.it>
Subject: Re: [LTP] [PATCH v3 3/3] syscalls/ioctl_ns0[156]: align stack and
 wait for child
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

SGkhCj4gPiA+IEkgcmVjYWxsIEkgc3RhcnRlZCB3aXRoIHRoYXQgcG9zaXRpb24gKGZyZWUgYWxs
KSwgYW5kIEkgdGhvdWdodCB5b3UKPiA+ID4gdHVybmVkIG1lIGFyb3VuZCBhZnRlciB0aGlzIG1h
bnkgeWVhcnMgOi0pLgo+ID4gCj4gPiBXZWxsIEkgZGlkbid0IGNhcmUgdGhhdCBtdWNoLCBidXQg
SSBndWVzcyB0aGF0IEkgbGVhbiBzbGlnaHRseSB0byBmcmVlCj4gPiB0aGUgbWVtb3J5IDotKS4K
PiAKPiBPSywgc28gc2hvdWxkIEkgcmVwb3N0IG9yIGlzIHRoaXMgZ29vZCB0byBnbyB3aXRoIGZy
ZWUgYWRkZWQgdG8gY2xlYW51cD8KCkxldCdzIGRvIHRoYXQuCgpBbmQgSSB3aWxsIHdyaXRlIGFu
IFJGQyBwYXRjaCBmb3IgdGhlIHRlc3Qtd3JpdGluZy1ndWlkZWxpbmVzLgoKLS0gCkN5cmlsIEhy
dWJpcwpjaHJ1YmlzQHN1c2UuY3oKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0
cy5saW51eC5pdC9saXN0aW5mby9sdHAK
