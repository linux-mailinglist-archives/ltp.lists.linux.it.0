Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C9BEF24C97E
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Aug 2020 03:19:02 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 773EE3C2FCF
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Aug 2020 03:19:02 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id B8C0B3C2F8F
 for <ltp@lists.linux.it>; Fri, 21 Aug 2020 03:18:55 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id D6F8F600468
 for <ltp@lists.linux.it>; Fri, 21 Aug 2020 03:18:53 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.76,335,1592841600"; d="scan'208";a="98363875"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 21 Aug 2020 09:18:50 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 6A7CC48990C1;
 Fri, 21 Aug 2020 09:18:45 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 21 Aug 2020 09:18:46 +0800
To: Li Wang <liwang@redhat.com>, Feiyu Zhu <zhufy.jy@cn.fujitsu.com>
References: <1597919168-10702-1-git-send-email-zhufy.jy@cn.fujitsu.com>
 <1597919168-10702-2-git-send-email-zhufy.jy@cn.fujitsu.com>
 <CAEemH2eUd3yCuxt3iawHPXKUSryiJprud3HvneSr=JK_1wFhXg@mail.gmail.com>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <43a404a1-dd4b-d091-5723-e756604fbbc8@cn.fujitsu.com>
Date: Fri, 21 Aug 2020 09:18:43 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAEemH2eUd3yCuxt3iawHPXKUSryiJprud3HvneSr=JK_1wFhXg@mail.gmail.com>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 6A7CC48990C1.AFA8C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=-1.0 required=7.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/4] syscalls/kill03,
 04: Cleanup && Convert to new library
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

SGkgTGkKCgo+IAo+IEZlaXl1IFpodSA8emh1ZnkuanlAY24uZnVqaXRzdS5jb20gPG1haWx0bzp6
aHVmeS5qeUBjbi5mdWppdHN1LmNvbT4+IHdyb3RlOgo+IAo+ICAgICAuLi4KPiAgICAgKyNpbmNs
dWRlIDx1bmlzdGQuaD4KPiAgICAgKyNpbmNsdWRlICJ0c3RfdGVzdC5oIgo+ICAgICArCj4gICAg
ICtzdGF0aWMgcGlkX3QgcmVhbF9waWQsIGZha2VfcGlkLCBpbnRfbWluX3BpZDsKPiAgICAgK3N0
YXRpYyB2b2lkIGNsZWFudXAodm9pZCk7Cj4gICAgICsKPiAgICAgK3N0YXRpYyBzdHJ1Y3QgdGNh
c2Ugewo+ICAgICArwqAgwqAgwqAgwqBpbnQgdGVzdF9zaWc7Cj4gICAgICvCoCDCoCDCoCDCoGlu
dCBleHBfZXJybm87Cj4gICAgICvCoCDCoCDCoCDCoGludCBjaGlsZF9mbGFnOwo+IAo+IAo+IFRo
ZSBjaGlsZF9mbGFnIGZpZWxkIGlzIG5vdCBuZWNlc3NhcnksIHdlIGNvdWxkIHByZXBhcmUgYSBy
ZWFsIGNoaWxkIGluIAo+IHNldHVwKCkKPiBhbmTCoHJlY2xhaW0gaXQgYWZ0ZXIgdGVzdGluZyB2
aWEgY2hlY2sgdGhlIHJlYWxfcGlkIHZhbHVlLCB0aGF0IHdpbGwgYmUgCj4gbW9yZSBlYXNpbHku
CldoZW4gSSByZXZpZXdlZCB0aGlzIHBhdGNoIGluIGludGVybmFsLCBJIGhhZCB0aGUgc2FtZSBp
ZGVhLiBCdXQgd2hlbiBJIAp0cnkgaXQgYW5kIHRoaXMgY2FzZSB3aWxsIGhhbmcgYmVjYXVzZSBz
dWIgdGVzdCB3aWxsIHdhaXQgY2hpbGRyZW4gCmZpbmlzaGVkIGJ5IHVzaW5nIHRzdF9yZWFwX2No
aWxkcmVucyBiZWxvdzoKCmxpYi90c3RfdGVzdC5jCnN0YXRpYyB2b2lkIHJ1bl90ZXN0cyh2b2lk
KQp7CgkuLi4KCSBmb3IgKGkgPSAwOyBpIDwgdHN0X3Rlc3QtPnRjbnQ7IGkrKykgewogICAgICAg
ICAgICAgICAgIHNhdmVkX3Jlc3VsdHMgPSAqcmVzdWx0czsKICAgICAgICAgICAgICAgICB0c3Rf
dGVzdC0+dGVzdChpKTsKCiAgICAgICAgICAgICAgICAgaWYgKGdldHBpZCgpICE9IG1haW5fcGlk
KSB7CiAgICAgICAgICAgICAgICAgICAgICAgICBleGl0KDApOwogICAgICAgICAgICAgICAgIH0K
CiAgICAgICAgICAgICAgICAgdHN0X3JlYXBfY2hpbGRyZW4oKTsKCiAgICAgICAgICAgICAgICAg
aWYgKHJlc3VsdHNfZXF1YWwoJnNhdmVkX3Jlc3VsdHMsIHJlc3VsdHMpKQogICAgICAgICAgICAg
ICAgICAgICAgICAgdHN0X2JyayhUQlJPSywgIlRlc3QgJWkgaGF2ZW4ndCByZXBvcnRlZCAKcmVz
dWx0cyEiLCBpKTsKICAgICAgICAgfQoKCn0KCkFsc28sIHdlIGNhbiB1c2UgdGhlIGN1cnJlbnQg
cHJvY2VzcyBpZCBidXQgaXQgbWF5IGhhcyB1bmV4cGVjdGVkIHJlc3VsdCAKd2hlbiBraWxsIHN1
Y2NlZWQuIFNvIGZvcmsgYSBjaGlsZCB0byB0ZXN0IG1heWJlIGEgYmV0dGVyIHNvbHV0aW9uLgo+
IAo+IC0tIAo+IFJlZ2FyZHMsCj4gTGkgV2FuZwo+IAo+IAoKCgotLSAKTWFpbGluZyBsaXN0IGlu
Zm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
