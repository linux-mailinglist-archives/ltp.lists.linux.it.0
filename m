Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 136752A972B
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Nov 2020 14:42:19 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D6FFD3C60D2
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Nov 2020 14:42:18 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 74CAD3C2391
 for <ltp@lists.linux.it>; Fri,  6 Nov 2020 14:42:17 +0100 (CET)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id CF6AF60035C
 for <ltp@lists.linux.it>; Fri,  6 Nov 2020 14:42:16 +0100 (CET)
X-Originating-IP: 78.113.208.212
Received: from kmaincent-XPS-13-7390 (212.208.113.78.rev.sfr.net
 [78.113.208.212]) (Authenticated sender: kory.maincent@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 2FEFE240008;
 Fri,  6 Nov 2020 13:42:15 +0000 (UTC)
Date: Fri, 6 Nov 2020 14:42:13 +0100
From: =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>
To: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <20201106144213.5404e769@kmaincent-XPS-13-7390>
In-Reply-To: <87d525b8-b48b-980e-f606-9ea16ef6f246@oracle.com>
References: <20201106103748.20241-1-kory.maincent@bootlin.com>
 <87d525b8-b48b-980e-f606-9ea16ef6f246@oracle.com>
Organization: bootlin
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] tcp_cmds/ping: TCONF on unknown -f parameter
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGVsbG8gQWxleGV5LAoKT24gRnJpLCA2IE5vdiAyMDIwIDE0OjM4OjMzICswMzAwCkFsZXhleSBL
b2RhbmV2IDxhbGV4ZXkua29kYW5ldkBvcmFjbGUuY29tPiB3cm90ZToKCj4gT24gMDYuMTEuMjAy
MCAxMzozNywgS29yeSBNYWluY2VudCB3cm90ZToKPiA+IFRoZSBwaW5nIGZyb20gYnVzeWJveCBk
b2VzIG5vdCBoYXZlIC1mIHBhcmFtZXRlci4KPiA+IFJldHVybiBUQ09ORiBpbiB0aGF0IGNhc2Uu
Cj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IEtvcnkgTWFpbmNlbnQgPGtvcnkubWFpbmNlbnRAYm9v
dGxpbi5jb20+Cj4gPiAtLS0KPiA+ICB0ZXN0Y2FzZXMvbmV0d29yay90Y3BfY21kcy9waW5nL3Bp
bmcwMi5zaCB8IDQgKysrKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKPiA+
IAo+ID4gZGlmZiAtLWdpdCBhL3Rlc3RjYXNlcy9uZXR3b3JrL3RjcF9jbWRzL3BpbmcvcGluZzAy
LnNoCj4gPiBiL3Rlc3RjYXNlcy9uZXR3b3JrL3RjcF9jbWRzL3BpbmcvcGluZzAyLnNoIGluZGV4
Cj4gPiBlMGE2M2M1ZjYuLjZkYWYyMjYzNSAxMDA3NTUgLS0tCj4gPiBhL3Rlc3RjYXNlcy9uZXR3
b3JrL3RjcF9jbWRzL3BpbmcvcGluZzAyLnNoICsrKwo+ID4gYi90ZXN0Y2FzZXMvbmV0d29yay90
Y3BfY21kcy9waW5nL3BpbmcwMi5zaCBAQCAtMjcsNiArMjcsMTAgQEAKPiA+IGRvX3Rlc3QoKSBs
b2NhbCBpcGFkZHI9JCh0c3RfaXBhZGRyIHJob3N0KQo+ID4gIAlsb2NhbCBzCj4gPiAgCj4gPiAr
CWlmICEgJFBJTkcgLWMgMSAtZiAkaXBhZGRyID4vZGV2L251bGw7IHRoZW4KPiA+ICsJCXRzdF9i
cmsgVENPTkYgIiRQSU5HOiBpbnZhbGlkIG9wdGlvbiAtLSAnZiciICAKPiAKPiBIaSBLb3J5LAo+
IAo+IElmIGl0J3Mgbm90IHN1cHBvcnRlZCwgd2hhdCBhYm91dCByZXBsYWNpbmcgaXQgd2l0aCAn
LWkgMCc/CgpBaCB5ZXMgZ29vZCBpZGVhLCB0aGFua3MuCgpSZWdhcmRzLAoKPiAKPiAKPiA+ICsJ
ZmkKPiA+ICsKPiA+ICAJZm9yIHMgaW4gJFBBQ0tFVFNJWkVTOyBkbwo+ID4gIAkJRVhQRUNUX1BB
U1MgJFBJTkcgLWMgJENPVU5UIC1mIC1zICRzICRpcGFkZHIgLXAKPiA+ICIkcGF0IiBcPi9kZXYv
bnVsbCBkb25lCj4gPiAgIAo+IAoKCgotLSAKS8O2cnkgTWFpbmNlbnQsIEJvb3RsaW4KRW1iZWRk
ZWQgTGludXggYW5kIGtlcm5lbCBlbmdpbmVlcmluZwpodHRwczovL2Jvb3RsaW4uY29tCgotLSAK
TWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
