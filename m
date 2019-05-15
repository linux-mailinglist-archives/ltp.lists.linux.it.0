Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 106851EA8F
	for <lists+linux-ltp@lfdr.de>; Wed, 15 May 2019 11:01:40 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E2E2B3EA1E2
	for <lists+linux-ltp@lfdr.de>; Wed, 15 May 2019 11:01:39 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id EC2E53EA13F
 for <ltp@lists.linux.it>; Wed, 15 May 2019 11:01:37 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 9544620141D
 for <ltp@lists.linux.it>; Wed, 15 May 2019 11:01:29 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.60,472,1549900800"; d="scan'208";a="63134377"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 15 May 2019 17:01:26 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
 by cn.fujitsu.com (Postfix) with ESMTP id C62994CDBCD8;
 Wed, 15 May 2019 17:01:26 +0800 (CST)
Received: from [10.167.215.30] (10.167.215.30) by
 G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 id 14.3.439.0; Wed, 15 May 2019 17:01:27 +0800
Message-ID: <5CDBD564.8010300@cn.fujitsu.com>
Date: Wed, 15 May 2019 17:01:24 +0800
From: xuyang <xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Petr Vorel <pvorel@suse.cz>
References: <1557732392-7049-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20190513131451.GA22761@dell5510> <5CDA5124.3070708@cn.fujitsu.com>
 <20190514120119.GA26452@dell5510>
In-Reply-To: <20190514120119.GA26452@dell5510>
X-Originating-IP: [10.167.215.30]
X-yoursite-MailScanner-ID: C62994CDBCD8.AF930
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.0 required=7.0 tests=none autolearn=disabled
 version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH] ltp-cap.m4: add libcap version detection && fix
 compiler error
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

b24gMjAxOS8wNS8xNCAyMDowMSwgUGV0ciBWb3JlbCB3cm90ZToKPiBIaSBZYW5nLAo+Cj4+IEhp
IFBldGVyCj4+ICAgIEkgc2VudCBhIG1haWwgdG8geW91IGxhc3QgRnJpZGF5IG1lbnRpb25lZCB0
aGlzIHByb2JsZW0uCj4gTm90aWNlZCwgYmVmb3JlIEkgZmluZCBhIHRpbWUgeW91IHNlbmQgYSBw
YXRjaCwgc28gSSByZXBsaWVkIHRvIGl0IChpdCdzIGFsd2F5cwo+IGJldHRlciB0byBzZW5kIGEg
cXVlc3Rpb24gaW4gcHVibGljKS4KPgpPSy4gSSAgZ290IGl0LgoKPj4gQXQgdGhlIGJlZ2lubmlu
ZywgSQo+PiAgICB0aGluayBpdCBtYWtlcyBubyBzZW5zZSBiZWNhdXNlIGxpYmNhcC0xIGlzIHRv
byBvbGQuICBCdXQgSSBub3RpY2VzIHRoYXQgbHRwLXF1b3RhLm00Cj4+ICAgIGhhcyBxdW90YV92
MSBhbmQgcXVvdGFfdjIuIEkgY2hhbmdlcyBteSBtaW5kLgo+PiAgICBTaW5jZSB3ZSBoYXZlIGRy
b3AgbGlibnVtYSB2MSwgSSBhZ3JlZSB3aXRoIHlvdSB0aGF0IHdlIGFsc28gZHJvcCBsaWJjYXAg
djEodG9vIG9sZCkuCj4+ICAgIEFsc28sIEkgdGhpbmsgd2Ugc2hvdWxkIGRyb3AgcXVvdGFfdjEg
YmVjYXVzZSBpdCBpcyB0b28gb2xkIChzaW5jZSBMaW51eCAyLjQuMjIsIFFfR0VUSU5GTyBoYXMK
Pj4gICAgYmVlbiBzdXBwb3J0ZWQgaW4ga2VybmVsKS4KPiBHb29kIHBvaW50LiBCdXQgSSdtIG5v
dCBzdXJlIGlmIGl0J3MgdGhlIHNhbWUsIGFzIFFGTVRfVkZTX09MRCBpcyBwYXJ0IG9mIGtlcm5l
bAo+IHNvdXJjZSB0cmVlIChwYXJ0IG9mIGtlcm5lbCBzcGFjZSBjb2RlKSBzbyBpdCBtYWtlcyBz
ZW5zZSB0byB0ZXN0IGl0LCB3aGVyZWFzCj4gbGliY2FwIHYxIGFuZCBsaWJudW1hIHYxIGFyZSBq
dXN0IG9sZCB2ZXJzaW9ucyBvZiB1c2VyIHNwYWNlIGxpYnJhcnkuCj4gT3IgYW0gSSB3cm9uZz8K
SGkgUGV0cgoKICAgIEkgaGF2ZSBzZWVuIGtlcm5lbCBzb3VyY2UgYWJvdXQgcXVvdGEgYW5kIHRy
eSBpdC4gSSB0aGluayB5b3UgYXJlIHJpZ2h0LiAgQnV0IGN1cnJlbnQgcXVvdGFfdjEKYW5kIHF1
b3RhX3YyIGRldGVjdGlvbiBoYXMgcHJvYmxlbS4gSW4ga2VybmVsIHNvdXJjZSwgSSBkaXNhYmxl
IENPTkZJR19RRk1UX1YyIGFuZCBlbmFibGUgQ09ORklHX1FGTVRfVjEKLHRoZW4gSSBmb3VuZCBs
dHAgc3RpbGwgZGV0ZWN0cyBxdW90YXYyIGluc3RlYWQgb2YgcXVvdGF2MSwgIGFuZCBydW4gLi9x
dW90YWN0bDAxLCB0aGUgZm9sbG93aW5nIGVycm9yIG9jY3VyczoKCi4vcXVvdGFjdGwwMQp0c3Rf
ZGV2aWNlLmM6ODQ6IElORk86IEZvdW5kIGZyZWUgZGV2aWNlICcvZGV2L2xvb3AwJwp0c3RfbWtm
cy5jOjkwOiBJTkZPOiBGb3JtYXR0aW5nIC9kZXYvbG9vcDAgd2l0aCBleHQ0IG9wdHM9JycgZXh0
cmEgb3B0cz0nJwpta2UyZnMgMS40NC40ICgxOC1BdWctMjAxOCkKdHN0X3Rlc3QuYzoxMDk2OiBJ
TkZPOiBUaW1lb3V0IHBlciBydW4gaXMgMGggMDVtIDAwcwpxdW90YWN0bDAxLmM6MTk1OiBGQUlM
OiBxdW90YWN0bCBmYWlsZWQgdG8gdHVybiBvbiBxdW90YSBmb3IgdXNlcjogRVNSQ0gKcXVvdGFj
dGwwMS5jOjE5NTogRkFJTDogcXVvdGFjdGwgZmFpbGVkIHRvIHNldCBkaXNrIHF1b3RhIGxpbWl0
IGZvciB1c2VyOiBFU1JDSApxdW90YWN0bDAxLmM6MTk1OiBGQUlMOiBxdW90YWN0bCBmYWlsZWQg
dG8gZ2V0IGRpc2sgcXVvdGEgbGltaXQgZm9yIHVzZXI6IEVTUkNICnF1b3RhY3RsMDEuYzoxOTU6
IEZBSUw6IHF1b3RhY3RsIGZhaWxlZCB0byBzZXQgaW5mb3JtYXRpb24gYWJvdXQgcXVvdGFmaWxl
IGZvciB1c2VyOiBFU1JDSApxdW90YWN0bDAxLmM6MTk1OiBGQUlMOiBxdW90YWN0bCBmYWlsZWQg
dG8gZ2V0IGluZm9ybWF0aW9uIGFib3V0IHF1b3RhZmlsZSBmb3IgdXNlcjogRVNSQ0gKcXVvdGFj
dGwwMS5jOjE5NTogRkFJTDogcXVvdGFjdGwgZmFpbGVkIHRvIGdldCBxdW90YSBmb3JtYXQgZm9y
IHVzZXI6IEVTUkNICnF1b3RhY3RsMDEuYzoyMDY6IFBBU1M6IHF1b3RhY3RsIHN1Y2NlZWRlZCB0
byB1cGRhdGUgcXVvdGEgdXNhZ2VzIGZvciB1c2VyCnF1b3RhY3RsMDEuYzoyMDY6IFBBU1M6IHF1
b3RhY3RsIHN1Y2NlZWRlZCB0byB0dXJuIG9mZiBxdW90YSBmb3IgdXNlcgpxdW90YWN0bDAxLmM6
MTk1OiBGQUlMOiBxdW90YWN0bCBmYWlsZWQgdG8gdHVybiBvbiBxdW90YSBmb3IgZ3JvdXA6IEVT
UkNICnF1b3RhY3RsMDEuYzoxOTU6IEZBSUw6IHF1b3RhY3RsIGZhaWxlZCB0byBzZXQgZGlzayBx
dW90YSBsaW1pdCBmb3IgZ3JvdXA6IEVTUkNICnF1b3RhY3RsMDEuYzoxOTU6IEZBSUw6IHF1b3Rh
Y3RsIGZhaWxlZCB0byBzZXQgZGlzayBxdW90YSBsaW1pdCBmb3IgZ3JvdXA6IEVTUkNICnF1b3Rh
Y3RsMDEuYzoxOTU6IEZBSUw6IHF1b3RhY3RsIGZhaWxlZCB0byBzZXQgaW5mb3JtYXRpb24gYWJv
dXQgcXVvdGFmaWxlIGZvciBncm91cDogRVNSQ0gKcXVvdGFjdGwwMS5jOjE5NTogRkFJTDogcXVv
dGFjdGwgZmFpbGVkIHRvIGdldCBpbmZvcm1hdGlvbiBhYm91dCBxdW90YWZpbGUgZm9yIGdyb3Vw
OiBFU1JDSApxdW90YWN0bDAxLmM6MTk1OiBGQUlMOiBxdW90YWN0bCBmYWlsZWQgdG8gZ2V0IHF1
b3RhIGZvcm1hdCBmb3IgZ3JvdXA6IEVTUkNICnF1b3RhY3RsMDEuYzoyMDY6IFBBU1M6IHF1b3Rh
Y3RsIHN1Y2NlZWRlZCB0byB1cGRhdGUgcXVvdGEgdXNhZ2VzIGZvciBncm91cApxdW90YWN0bDAx
LmM6MjA2OiBQQVNTOiBxdW90YWN0bCBzdWNjZWVkZWQgdG8gdHVybiBvZmYgcXVvdGEgZm9yIGdy
b3VwCgpTdW1tYXJ5OgpwYXNzZWQgICA0CmZhaWxlZCAgIDEyCnNraXBwZWQgIDAKd2FybmluZ3Mg
MAoKS2luZCBSZWdhcmRzLApZYW5nIFh1Cgo+PiBLaW5kIFJlZ2FyZHMsCj4+IFlhbmcgWHUKPiBL
aW5kIHJlZ2FyZHMsCj4gUGV0cgo+Cj4KPgoKCgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRw
czovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
