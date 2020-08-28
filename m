Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id EB035255347
	for <lists+linux-ltp@lfdr.de>; Fri, 28 Aug 2020 05:22:30 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8B7BD3C561D
	for <lists+linux-ltp@lfdr.de>; Fri, 28 Aug 2020 05:22:30 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id C0BFB3C1410
 for <ltp@lists.linux.it>; Fri, 28 Aug 2020 05:22:25 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 512A81400B93
 for <ltp@lists.linux.it>; Fri, 28 Aug 2020 05:22:23 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.76,362,1592841600"; d="scan'208";a="98650984"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 28 Aug 2020 11:22:20 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 4AED848990D7;
 Fri, 28 Aug 2020 11:22:19 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 28 Aug 2020 11:22:19 +0800
To: Li Wang <liwang@redhat.com>, Petr Vorel <pvorel@suse.cz>
References: <20200825064706.GA7135@x230>
 <1598339667-24948-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <CAEemH2eS0PS=hmpiWBzkfBQ3cO4K2u2bVgcO5ZK4fz9N+xg7uQ@mail.gmail.com>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <716a3ffc-fa20-01df-a63f-86a5a50239af@cn.fujitsu.com>
Date: Fri, 28 Aug 2020 11:22:16 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CAEemH2eS0PS=hmpiWBzkfBQ3cO4K2u2bVgcO5ZK4fz9N+xg7uQ@mail.gmail.com>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 4AED848990D7.AFAAE
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=-1.4 required=7.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] travis: Use centos:7 instead of centos:6
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
Cc: LTP List <ltp@lists.linux.it>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkgTGksIFBldHIKCkRvZXMgaGF2ZSBhbnl0aGluZyBibG9jayB0aGlzIHBhdGNoPyBPciwgd2Ug
c2hvdWxkIGxpc3RlbiBzb21lIGFkdmlzZSAKZnJvbSBKYW4gYW5kIEN5cmlsPwoKcHM6IEFsc28s
IEFMR19TRVRfQUVBRF9BU1NPQ0xFTiB1bmRlZmluZWQgZXJyb3IgcGF0Y2ggbmVlZHMgdG8gYmUg
cmV2aWV3ZWQuCgpCZXN0IFJlZ2FyZHMKWWFuZyBYdQo+IAo+IAo+IE9uIFR1ZSwgQXVnIDI1LCAy
MDIwIGF0IDM6MTQgUE0gWWFuZyBYdSA8eHV5YW5nMjAxOC5qeUBjbi5mdWppdHN1LmNvbSAKPiA8
bWFpbHRvOnh1eWFuZzIwMTguanlAY24uZnVqaXRzdS5jb20+PiB3cm90ZToKPiAKPiAgICAgSSBo
YXZlIHRoaXMgaWRlYSB3aGVuIEkgbWVldCBBTEdfU0VUX0FFQURfQVNTT0NMRU4gdW5kZWZpbmVk
IGVycm9yCj4gICAgIG9uIGNlbnRvczcuCj4gICAgIEl0IGlzIG1vcmUgZnJpZW5kbHkgZm9yIGNl
bnRvczcgdXNlciBhbmQgbW9yZSBtZWFuaW5nZnVsLiBjZW50b3M2IGlzCj4gICAgIG91dGRhdGVk
Cj4gICAgIGFuZCB3ZSBzaG91bGQgZHJvcCBpdC4KPiAKPiAgICAgU2lnbmVkLW9mZi1ieTogWWFu
ZyBYdSA8eHV5YW5nMjAxOC5qeUBjbi5mdWppdHN1LmNvbQo+ICAgICA8bWFpbHRvOnh1eWFuZzIw
MTguanlAY24uZnVqaXRzdS5jb20+Pgo+IAo+IEFja2VkLWJ5OiBMaSBXYW5nIDxsaXdhbmdAcmVk
aGF0LmNvbSA8bWFpbHRvOmxpd2FuZ0ByZWRoYXQuY29tPj4KPiAKPiAgICAgLS0tCj4gICAgICDC
oC50cmF2aXMueW1sIHwgMiArLQo+ICAgICAgwqAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDEgZGVsZXRpb24oLSkKPiAKPiAgICAgZGlmZiAtLWdpdCBhLy50cmF2aXMueW1sIGIvLnRy
YXZpcy55bWwKPiAgICAgaW5kZXggZThlMzE4OWFmLi4zYzVmZjk5YjcgMTAwNjQ0Cj4gICAgIC0t
LSBhLy50cmF2aXMueW1sCj4gICAgICsrKyBiLy50cmF2aXMueW1sCj4gICAgIEBAIC00NCw3ICs0
NCw3IEBAIG1hdHJpeDoKPiAgICAgIMKgIMKgIMKgIMKgIMKgIMKgY29tcGlsZXI6IGNsYW5nCj4g
Cj4gICAgICDCoCDCoCDCoCDCoCDCoC0gb3M6IGxpbnV4Cj4gICAgIC3CoCDCoCDCoCDCoCDCoCBl
bnY6IERJU1RSTz1jZW50b3M6NiBUUkVFPW91dAo+ICAgICArwqAgwqAgwqAgwqAgwqAgZW52OiBE
SVNUUk89Y2VudG9zOjcgVFJFRT1vdXQKPiAgICAgIMKgIMKgIMKgIMKgIMKgIMKgY29tcGlsZXI6
IGdjYwo+IAo+ICAgICAgwqAgwqAgwqAgwqAgwqAtIG9zOiBsaW51eAo+ICAgICAtLSAKPiAgICAg
Mi4yMy4wCj4gCj4gCj4gCj4gCj4gICAgIC0tIAo+ICAgICBNYWlsaW5nIGxpc3QgaW5mbzogaHR0
cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAKPiAKPiAKPiAKPiAtLSAKPiBSZWdhcmRz
LAo+IExpIFdhbmcKCgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4
Lml0L2xpc3RpbmZvL2x0cAo=
