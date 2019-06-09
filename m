Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E26E93A6AE
	for <lists+linux-ltp@lfdr.de>; Sun,  9 Jun 2019 17:40:53 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 926B03EADE9
	for <lists+linux-ltp@lfdr.de>; Sun,  9 Jun 2019 17:40:53 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 772183EA5CE
 for <ltp@lists.linux.it>; Sun,  9 Jun 2019 17:40:49 +0200 (CEST)
Received: from out30-42.freemail.mail.aliyun.com
 (out30-42.freemail.mail.aliyun.com [115.124.30.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 83D721000A2F
 for <ltp@lists.linux.it>; Sun,  9 Jun 2019 17:40:40 +0200 (CEST)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R201e4; CH=green; DM=||false|;
 FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04395; MF=caspar@linux.alibaba.com; NM=1;
 PH=DS; RN=4; SR=0; TI=SMTPD_---0TTmOwIQ_1560094838; 
Received: from linux.alibaba.com(mailfrom:caspar@linux.alibaba.com
 fp:SMTPD_---0TTmOwIQ_1560094838) by smtp.aliyun-inc.com(127.0.0.1);
 Sun, 09 Jun 2019 23:40:39 +0800
Date: Sun, 9 Jun 2019 23:40:38 +0800
From: Caspar Zhang <caspar@linux.alibaba.com>
To: Li Wang <liwang@redhat.com>
Message-ID: <20190609154038.GA53103@linux.alibaba.com>
References: <f11c83459b71fbf399794fb8363f2b538b0b6346.1559207183.git.caspar@casparzhang.com>
 <5e8374fa7f4ea9d64cdfc39a2ca449761327c257.1559207183.git.caspar@casparzhang.com>
 <CAEemH2eV6RZKdZV0MMuogAzyvoXCsuvrfp3v_1TNtO1cOoAPGA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2eV6RZKdZV0MMuogAzyvoXCsuvrfp3v_1TNtO1cOoAPGA@mail.gmail.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-7.5 required=7.0 tests=ENV_AND_HDR_SPF_MATCH,
 SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Cc: LTP List <ltp@lists.linux.it>, Caspar Zhang <caspar@linux.alibaba.com>
Subject: Re: [LTP] [PATCH 2/3] lib/test.sh: TCONF needs to be counted
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

T24gRnJpLCBNYXkgMzEsIDIwMTkgYXQgMTE6MTc6MTRBTSArMDgwMCwgTGkgV2FuZyB3cm90ZToK
Pgo+Cj4gT24gVGh1LCBNYXkgMzAsIDIwMTkgYXQgNToxMCBQTSBDYXNwYXIgWmhhbmcgPFsxXWNh
c3BhckBsaW51eC5hbGliYWJhLmNvbT4KPiB3cm90ZToKPgo+ICAgICBUQ09ORiBzaG91bGQgYWxz
byBiZSBvbmUgb2YgZXhpdCBzdGF0dXNlcyBpbiBhIHNpbmdsZSB0ZXN0LCBlbHNlIHRoZQo+ICAg
ICBvdXRwdXQgb2YgVFNUX0NPVU5UIGluIHNoZWxsIHRlc3RzIGNvdWxkIGJlIHdyb25nLgo+Cj4g
ICAgIFdyb25nOgo+ICAgICA8PDx0ZXN0X291dHB1dD4+Pgo+ICAgICBtZW1jZ191c2VfaGllcmFy
Y2h5X3Rlc3QgMSBUSU5GTzogU3RhcnRpbmcgdGVzdCAxCj4gICAgIG1lbWNnX3VzZV9oaWVyYXJj
aHlfdGVzdCAxIFRJTkZPOiBzZXQgL2Rldi9tZW1jZy9tZW1vcnkudXNlX2hpZXJhcmNoeSB0byAw
Cj4gICAgIGZhaWxlZAo+ICAgICBtZW1jZ191c2VfaGllcmFyY2h5X3Rlc3QgMSBUUEFTUzogcHJv
Y2VzcyAyODY1OCBpcyBraWxsZWQKPiAgICAgbWVtY2dfdXNlX2hpZXJhcmNoeV90ZXN0IDIgVElO
Rk86IFN0YXJ0aW5nIHRlc3QgMgo+ICAgICBtZW1jZ191c2VfaGllcmFyY2h5X3Rlc3QgMiBUSU5G
Tzogc2V0IC9kZXYvbWVtY2cvbWVtb3J5LnVzZV9oaWVyYXJjaHkgdG8gMAo+ICAgICBmYWlsZWQK
PiAgICAgbWVtY2dfdXNlX2hpZXJhcmNoeV90ZXN0IDIgVENPTkY6IG1lbW9yeS51c2VfaGllcmFy
Y2h5IGFscmVhZHkgYmVlbiAxLAo+ICAgICBibGFtZSBzeXN0ZW1kLCBza2lwCj4gICAgIG1lbWNn
X3VzZV9oaWVyYXJjaHlfdGVzdCAyIFRJTkZPOiBTdGFydGluZyB0ZXN0IDMKPiAgICAgbWVtY2df
dXNlX2hpZXJhcmNoeV90ZXN0IDIgVElORk86IHNldCAvZGV2L21lbWNnL21lbW9yeS51c2VfaGll
cmFyY2h5IHRvIDAKPiAgICAgZmFpbGVkCj4gICAgIG1lbWNnX3VzZV9oaWVyYXJjaHlfdGVzdCAy
IFRQQVNTOiBlY2hvIDAgPiBzdWJncm91cC9tZW1vcnkudXNlX2hpZXJhcmNoeQo+ICAgICBmYWls
ZWQgYXMgZXhwZWN0ZWQKPiAgICAgPDw8ZXhlY3V0aW9uX3N0YXR1cz4+Pgo+Cj4gICAgIFJpZ2h0
Ogo+ICAgICA8PDx0ZXN0X291dHB1dD4+Pgo+ICAgICBtZW1jZ191c2VfaGllcmFyY2h5X3Rlc3Qg
MSBUSU5GTzogU3RhcnRpbmcgdGVzdCAxCj4gICAgIG1lbWNnX3VzZV9oaWVyYXJjaHlfdGVzdCAx
IFRJTkZPOiBzZXQgL2Rldi9tZW1jZy9tZW1vcnkudXNlX2hpZXJhcmNoeSB0byAwCj4gICAgIGZh
aWxlZAo+ICAgICBtZW1jZ191c2VfaGllcmFyY2h5X3Rlc3QgMSBUUEFTUzogcHJvY2VzcyAyNjgy
NSBpcyBraWxsZWQKPiAgICAgbWVtY2dfdXNlX2hpZXJhcmNoeV90ZXN0IDIgVElORk86IFN0YXJ0
aW5nIHRlc3QgMgo+ICAgICBtZW1jZ191c2VfaGllcmFyY2h5X3Rlc3QgMiBUSU5GTzogc2V0IC9k
ZXYvbWVtY2cvbWVtb3J5LnVzZV9oaWVyYXJjaHkgdG8gMAo+ICAgICBmYWlsZWQKPiAgICAgbWVt
Y2dfdXNlX2hpZXJhcmNoeV90ZXN0IDIgVENPTkY6IG1lbW9yeS51c2VfaGllcmFyY2h5IGFscmVh
ZHkgYmVlbiAxLAo+ICAgICBibGFtZSBzeXN0ZW1kLCBza2lwCj4gICAgIG1lbWNnX3VzZV9oaWVy
YXJjaHlfdGVzdCAzIFRJTkZPOiBTdGFydGluZyB0ZXN0IDMKPiAgICAgbWVtY2dfdXNlX2hpZXJh
cmNoeV90ZXN0IDMgVElORk86IHNldCAvZGV2L21lbWNnL21lbW9yeS51c2VfaGllcmFyY2h5IHRv
IDAKPiAgICAgZmFpbGVkCj4gICAgIG1lbWNnX3VzZV9oaWVyYXJjaHlfdGVzdCAzIFRQQVNTOiBl
Y2hvIDAgPiBzdWJncm91cC9tZW1vcnkudXNlX2hpZXJhcmNoeQo+ICAgICBmYWlsZWQgYXMgZXhw
ZWN0ZWQKPiAgICAgPDw8ZXhlY3V0aW9uX3N0YXR1cz4+Pgo+Cj4KPiBUaGlzIGlzIGEgZ29vZCBj
YXRjaCwgYnV0IG1heWJlIGl0J3Mgbm90IHdpc2UgdG8gc2ltcGx5IHJlZ2FyZCB0aGUgVENPTkYg
YXMgYQo+IHNpbmdsZSB0ZXN0LCBiZWNhdXNlIHRoZXJlIGFyZSBtYW55IHN5c3RlbS1jb25maWcg
ZGV0ZWN0aW9ucyBpbiBzZXR1cCgpCj4gZnVuY3Rpb24sIHRoYXQgd2lsbCBtYWtlIExUUCBnaXZl
c8KgYSBtZW5kYWNpb3VzIHJlcG9ydCBvbiB0aGUgdGVzdCBudW1iZXJzIGlmCj4gYXBwbHlpbmcg
dGhpcyBwYXRjaC4KPgo+IGUuZy4KPgo+IGlmIHRzdF9rdmNtcCAtbHQgIjMuMTAiOyB0aGVuCj4g
wqAgwqAgdHN0X2JyayBUQ09ORiAidGVzdCBtdXN0IGJlIHJ1biB3aXRoIGtlcm5lbCAzLjEwIG9y
IG5ld2VyIgo+IGZpCj4gaWYgZGlyIHBhdGggbm90IGV4aXN0OyB0aGVuCj4gwqAgwqAgdHN0X2Jy
ayBUQ09ORiAic3lzdGVtIGRvZXMgbm90IGhhdmUgeHh4eC8iCj4gZmkKPiBhbmQgc28gb24uLi4K
ClRDT05GIHVzdWFsbHkgcmVwb3J0IG9ubHkgb25jZSwgSSB3b3VsZCBzdGlsbCB0YWtlIGl0IGEg
dmFsaWQgcmVwb3J0IG9uCm51bWJlcnMuIFRha2UgeW91ciBjYXNlIGFzIGV4YW1wbGUsIEkgZ3Vl
c3Mgd2UgYXJlIGFibGUgdG8gc2VlIHJlc3VsdHMKbGlrZToKCgogICAgbXl0ZXN0IDEgVFBBU1M6
IHBhc3MKCm9yCgogICAgbXl0ZXN0IDEgVENPTkY6IHRlc3QgbXVzdCBiZSBydW4gd2l0aCBrZXJu
ZWwgMy4xMCBvciBuZXdlcgoKb3IKCiAgICBteXRlc3QgMSBUQ09ORjogc3lzdGVtIGRvZXMgbm90
IGhhdmUgeHh4LwoKVGhhbmtzLApDYXNwYXIKCj4KPiDCoAo+Cj4KPiAgICAgU2lnbmVkLW9mZi1i
eTogQ2FzcGFyIFpoYW5nIDxbMl1jYXNwYXJAbGludXguYWxpYmFiYS5jb20+Cj4gICAgIC0tLQo+
ICAgICDCoHRlc3RjYXNlcy9saWIvdGVzdC5zaCB8IDMgKy0tCj4gICAgIMKgMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQo+Cj4gICAgIGRpZmYgLS1naXQgYS90
ZXN0Y2FzZXMvbGliL3Rlc3Quc2ggYi90ZXN0Y2FzZXMvbGliL3Rlc3Quc2gKPiAgICAgaW5kZXgg
NjcwMjQ4ZWU1Li5hZGU4ZmNkZmYgMTAwNjQ0Cj4gICAgIC0tLSBhL3Rlc3RjYXNlcy9saWIvdGVz
dC5zaAo+ICAgICArKysgYi90ZXN0Y2FzZXMvbGliL3Rlc3Quc2gKPiAgICAgQEAgLTU4LDggKzU4
LDcgQEAgdHN0X3Jlc20oKQo+ICAgICDCoCDCoCDCoCDCoCBlY2hvICIgJEAiCj4KPiAgICAgwqAg
wqAgwqAgwqAgY2FzZSAiJHJldCIgaW4KPiAgICAgLcKgIMKgIMKgIMKgVFBBU1N8VEZBSUwpCj4g
ICAgIC3CoCDCoCDCoCDCoFRTVF9DT1VOVD0kKChUU1RfQ09VTlQrMSkpOzsKPiAgICAgK8KgIMKg
IMKgIMKgVFBBU1N8VEZBSUx8VENPTkYpIFRTVF9DT1VOVD0kKChUU1RfQ09VTlQrMSkpOzsKPiAg
ICAgwqAgwqAgwqAgwqAgZXNhYwo+ICAgICDCoH0KPgo+ICAgICAtLQo+ICAgICAyLjIxLjAKPgo+
Cj4gICAgIC0tCj4gICAgIE1haWxpbmcgbGlzdCBpbmZvOiBbM11odHRwczovL2xpc3RzLmxpbnV4
Lml0L2xpc3RpbmZvL2x0cAo+Cj4KPgo+IC0tCj4gUmVnYXJkcywKPiBMaSBXYW5nCj4KPiBSZWZl
cmVuY2VzOgo+Cj4gWzFdIG1haWx0bzpjYXNwYXJAbGludXguYWxpYmFiYS5jb20KPiBbMl0gbWFp
bHRvOmNhc3BhckBsaW51eC5hbGliYWJhLmNvbQo+IFszXSBodHRwczovL2xpc3RzLmxpbnV4Lml0
L2xpc3RpbmZvL2x0cAoKLS0KICAgICAgICBUaGFua3MsCiAgICAgICAgQ2FzcGFyCgotLSAKTWFp
bGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
