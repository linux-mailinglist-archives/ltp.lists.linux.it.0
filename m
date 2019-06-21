Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 612F44DEAE
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Jun 2019 03:28:17 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2E6982988EF
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Jun 2019 03:28:17 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 9B3743EA20C
 for <ltp@lists.linux.it>; Fri, 21 Jun 2019 03:28:11 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 833461A00880
 for <ltp@lists.linux.it>; Fri, 21 Jun 2019 03:28:04 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.63,398,1557158400"; d="scan'208";a="68323242"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 21 Jun 2019 09:26:24 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id 4257A4CDDAEF;
 Fri, 21 Jun 2019 09:26:21 +0800 (CST)
Received: from [10.167.215.30] (10.167.215.30) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 id 14.3.439.0; Fri, 21 Jun 2019 09:26:20 +0800
Message-ID: <5D0C323B.5020505@cn.fujitsu.com>
Date: Fri, 21 Jun 2019 09:26:19 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Petr Vorel <pvorel@suse.cz>
References: <20190606114134.GB13068@rei.lan>
 <1560156706-13617-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20190620120122.GB31382@dell5510>
In-Reply-To: <20190620120122.GB31382@dell5510>
X-Originating-IP: [10.167.215.30]
X-yoursite-MailScanner-ID: 4257A4CDDAEF.AD78B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH v3] sysctl/sysctl02: Add new regression test for
 overflow file-max
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Cj4gSGksCj4KPiBMR1RNLCBiZWxvdyBhcmUganVzdCBzbWFsbCBmb3JtYXR0aW5nIGlzc3Vlcy4K
PiBJJ20gZ29pbmcgdG8gbWVyZ2UgaXQgd2l0aCB0aGVzZSBjaGFuZ2VzIGJlbG93Lgo+Cj4+IFNp
Z25lZC1vZmYtYnk6IFlhbmcgWHU8eHV5YW5nMjAxOC5qeUBjbi5mdWppdHN1LmNvbT4KPj4gLS0t
Cj4+ICAgcnVudGVzdC9jb21tYW5kcyAgICAgICAgICAgICAgICAgICAgICB8ICAxICsKPj4gICB0
ZXN0Y2FzZXMvY29tbWFuZHMvc3lzY3RsL3N5c2N0bDAyLnNoIHwgOTYgKysrKysrKysrKysrKysr
KysrKysrKysrKysrCj4+ICAgMiBmaWxlcyBjaGFuZ2VkLCA5NyBpbnNlcnRpb25zKCspCj4+ICAg
Y3JlYXRlIG1vZGUgMTAwNzU1IHRlc3RjYXNlcy9jb21tYW5kcy9zeXNjdGwvc3lzY3RsMDIuc2gK
PiAuLi4KPj4gK3N5c2N0bF90ZXN0X292ZXJmbG93KCkKPj4gK3sKPj4gKwlsb2NhbCBvbGRfdmFs
dWU9JChjYXQgIiRkaXIiIiRuYW1lIikKPj4gKwo+PiArCXN5c2N0bCAtdyAiZnMuZmlsZS1tYXgi
PSQxPi9kZXYvbnVsbCAyPiYxCj4+ICsKPj4gKwlsb2NhbCB0ZXN0X3ZhbHVlPSQoY2F0ICIkZGly
IiIkbmFtZSIpCj4gYWdhaW4sIHdoeSAyIHN0aW5ncyBpbnN0ZWFkIG9mIG9uZT8KPiBsb2NhbCB0
ZXN0X3ZhbHVlPSQoY2F0ICIkZGlyJG5hbWUiKQpIaSBQZXRyCgogIEkgdXNlIDIgc3RyaW5ncyBi
ZWNhdXNlIHN5c2N0bCB1c2VzICJmcy5maWxlLW1heCIgYnV0IGNhdCB1c2VzICJmcy9maWxlLW1h
eCIgZmlsZS4KICBZb3VyIGJpZyBjaGFuZ2VzIGxvb2sgZ29vZCB0byBtZS4gIFRoYW5rcyBmb3Ig
eW91ciBjaGFuZ2VzLgoKPj4gKwo+PiArCWVjaG8gJHt0ZXN0X3ZhbHVlfSB8Z3JlcCAtcSAke29s
ZF92YWx1ZX0KPj4gKwlpZiBbICQ/IC1lcSAwIF07IHRoZW4KPj4gKwkJdHN0X3JlcyBUUEFTUyAi
ZmlsZS1tYXggb3ZlcmZsb3csIHJlamVjdCBpdCBhbmQga2VlcCBvbGQgdmFsdWUuIgo+IFBsZWFz
ZSBkb24ndCB1c2UgZG90Cj4KPj4gKwllbHNlCj4+ICsJCXRzdF9yZXMgVEZBSUwgImZpbGUtbWF4
IG92ZXJmbG93IGFuZCBzZXQgaXQgdG8gJHt0ZXN0X3ZhbHVlfS4iCj4gSGVyZSBhcyB3ZWxsLgo+
Cj4+ICsJZmkKPj4gKwljbGVhbnVwCj4+ICt9Cj4+ICsKPj4gK3N5c2N0bF90ZXN0X3plcm8oKQo+
PiArewo+PiArCXN5c2N0bCAtdyAiZnMuZmlsZS1tYXgiPTA+L2Rldi9udWxsIDI+JjEKPiBQbGVh
c2UgdXNlIC1xIG9wdGlvbiBpbnN0ZWFkIG9mIHJlZGlyZWN0aW5nLgo+PiArCVsgISAtZiAiJHN5
bXNfZmlsZSIgXSYmICB0c3RfYnJrIFRDT05GIFwKPj4gKwkJIiRzeW1zX2ZpbGUgd2FzIG5vdCBz
dXBwb3J0ZWQiCj4+ICsJY2F0ICRzeW1zX2ZpbGUgIHxncmVwIGthc2FuX3JlcG9ydD4vZGV2L251
bGwgMj4mMQo+PiArCWlmIFsgJD8gLWVxIDAgXTsgdGhlbgo+IEFsc28gZ3JlcCBoYXMgLXEsIG5v
IG5lZWQgdG8gdXNlIHBpcGU6Cj4KPiBpZiBncmVwIC1xIGthc2FuX3JlcG9ydCAkc3ltc19maWxl
OyB0aGVuCj4KPj4gKwkJZG1lc2cgfCBncmVwICJLQVNBTjogZ2xvYmFsLW91dC1vZi1ib3VuZHMg
aW4gX19kb19wcm9jX2RvdWxvbmd2ZWNfbWlubWF4Ij4vZGV2L251bGwKPiAtcSBoZXJlIGFzIHdl
bGwuCj4KPj4gKwkJaWYgWyAkPyAtZXEgMCBdOyB0aGVuCj4+ICsJCQl0c3RfcmVzIFRGQUlMICJm
aWxlLW1heCBpcyBzZXQgMCBhbmQgdHJpZ2dlciBhIEtBU0FOIGVycm9yIgo+PiArCQllbHNlCj4+
ICsJCQl0c3RfcmVzIFRQQVNTIFwKPj4gKwkJCQkiZmlsZS1tYXggaXMgc2V0IDAgYW5kIGRvZXNu
J3QgdHJpZ2dlciBhIEtBU0FOIGVycm9yIgo+IFByb2JhYmx5IGNhbiBiZSBvbiBzaW5nbGUgbGlu
ZS4KPgo+PiArCQlmaQo+PiArCWVsc2UKPj4gKwkJdHN0X3JlcyBUQ09ORiAia2VybmVsIGRvZXNu
J3Qgc3VwcG9ydCBLQVNBTiIKPj4gKwlmaQo+PiArfQo+PiArCj4+ICtjbGVhbnVwKCkKPj4gK3sK
Pj4gKwlzeXNjdGwgLXcgImZzLiIiJG5hbWUiPSR7b3JpZ192YWx1ZX0+L2Rldi9udWxsIDI+JjEK
PiBJdCdzIHNhZmUgbm90IHF1b3RlIHN0cmluZyAoJG5hbWUgaXMgc2FmZSwgYnV0IHlvdSBjYW4g
b2YgY291cnNlKQo+IHN5c2N0bCAtcSAtdyBmcy4kbmFtZT0kb3JpZ192YWx1ZQo+Cj4+ICt9Cj4+
ICsKPj4gK3RzdF9ydW4KPgo+IC4KPgoKCgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczov
L2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
