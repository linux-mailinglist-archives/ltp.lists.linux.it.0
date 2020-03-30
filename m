Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC741973CC
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Mar 2020 07:20:43 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9D1113C3160
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Mar 2020 07:20:42 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id ADC1B3C137B
 for <ltp@lists.linux.it>; Mon, 30 Mar 2020 07:20:38 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 257FC1A00E1E
 for <ltp@lists.linux.it>; Mon, 30 Mar 2020 07:20:36 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.72,322,1580745600"; d="scan'208";a="87869036"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 30 Mar 2020 13:20:30 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id 012E650A999A;
 Mon, 30 Mar 2020 13:10:14 +0800 (CST)
Received: from [10.167.220.69] (10.167.220.69) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 30 Mar 2020 13:20:29 +0800
Message-ID: <5E81819B.5070303@cn.fujitsu.com>
Date: Mon, 30 Mar 2020 13:20:27 +0800
From: Xiao Yang <yangx.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Li Wang <liwang@redhat.com>
References: <20200327213924.18816-1-pvorel@suse.cz>
 <4ff84a77-b858-6cae-a320-cfaed3646864@163.com>
 <20200328034253.GA2720439@x230> <5E80323C.5070408@cn.fujitsu.com>
 <CAEemH2chnkojt0oc9OVodwKOj27_7aTj1nHnkk_DVoOxUP-H7A@mail.gmail.com>
In-Reply-To: <CAEemH2chnkojt0oc9OVodwKOj27_7aTj1nHnkk_DVoOxUP-H7A@mail.gmail.com>
X-Originating-IP: [10.167.220.69]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 012E650A999A.ACC8A
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 0/6] C API: .needs_cmds and SAFE_RUN_CMD()
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

T24gMjAyMC8zLzMwIDEyOjM5LCBMaSBXYW5nIHdyb3RlOgo+IEhpIFhpYW8sCj4KPiBPbiBTdW4s
IE1hciAyOSwgMjAyMCBhdCAxOjM2IFBNIFhpYW8gWWFuZyA8eWFuZ3guanlAY24uZnVqaXRzdS5j
b20KPiA8bWFpbHRvOnlhbmd4Lmp5QGNuLmZ1aml0c3UuY29tPj4gd3JvdGU6Cj4KPiAgICAgT24g
MjAyMC8zLzI4IDExOjQyLCBQZXRyIFZvcmVsIHdyb3RlOgo+ICAgICAgPiBIaSBYaWFvLAo+ICAg
ICAgPgo+ICAgICAgPj4gT24gMy8yOC8yMCA1OjM5IEFNLCBQZXRyIFZvcmVsIHdyb3RlOgo+ICAg
ICAgPj4+ICsgVGhlcmUgaXMgYSBkb3VibGUgY2hlY2sgKGZpcnN0IGluCj4gICAgICA+Pj4gLm5l
ZWRzX2NtZHMsIHRoZW4gaW4gU0FGRV9SVU5fQ01EKCkpLCBtYXliZSB0aGF0J3Mgbm90IG5lZWRl
ZC4KPiAgICAgID4KPiAgICAgID4+IEhpIFBldHIsCj4gICAgICA+Cj4gICAgICA+PiBXaHkgZG8g
eW91IG5lZWQgdGhlIGR1cGxpY2F0ZSAubmVlZHNfY21kcyBmbGFnPyhpdCBpbnRyb2R1Y2VzCj4g
ICAgIHRoZSBkb3VibGUKPiAgICAgID4+IGNoZWNrIGFzIHlvdSBzYWlkKQo+ICAgICAgPgo+ICAg
ICAgPj4gVXN1YWxseSwgYWxsIHRlc3RzIHJ1biBjb21tYW5kcyBieSB0c3RfcnVuX2NtZCgpL1NB
RkVfUlVOX0NNRCgpCj4gICAgIGFuZCB0aGV5IGNhbgo+ICAgICAgPj4gcmVwb3J0IFRDT05GCj4g
ICAgICA+Cj4gICAgICA+PiBieSBwYXNzaW5nIFRTVF9SVU5fQ01EX0NIRUNLX0NNRCBzbyBpdCBp
cyBmYWlyIHRvIGJlIGEgcGFydCBvZgo+ICAgICAgPj4gdHN0X3J1bl9jbWQoKS9TQUZFX1JVTl9D
TUQoKS4KPiAgICAgID4KPiAgICAgID4gVGhhbmtzIGZvciB5b3VyIHJldmlldy4KPiAgICAgID4g
SSBndWVzcyBDeXJpbCB3aWxsIHByZWZlciAubmVlZHNfY21kcywgYXMgaXQgY2FuIGJlIHBhcnNl
ZCAtCj4gICAgIG1ldGFkYXRhIHByb2plY3Q6Cj4gICAgICA+IGh0dHBzOi8vcGVvcGxlLmtlcm5l
bC5vcmcvbWV0YW4vdG93YXJkcy1wYXJhbGxlbC1rZXJuZWwtdGVzdC1ydW5zCj4gICAgICA+IGh0
dHBzOi8vZ2l0aHViLmNvbS9tZXRhbi11Y3cvbHRwL3RyZWUvbWFzdGVyL2RvY3BhcnNlCj4gICAg
IEhpIFBldHLvvIwKPgo+ICAgICBUaGFuayB5b3UgZm9yIHNoYXJpbmcgdGhlc2UgaW5mby4KPiAg
ICAgRG9lcyBDeXJpbCB3YW50IHRvIGdldCBtZXRhZGF0YSBmcm9tIHN0cnVjdCB0c3RfdGVzdCBk
aXJlY3RseT8KPgo+ICAgICBIb3cgYWJvdXQgdGhlIHJvdWdoIGRlc2lnbj8KPiAgICAgMSkgLm5l
ZWRzX2NtZHMgb25seSBzYXZlcyB0aGUgcmVxdWlyZWQgY29tbWFuZHMuKGRvZXNuJ3QgZG8gYW55
IGNoZWNrKQo+ICAgICAyKSBwYXNzIHRoZSBjb3JyZXNwb25kaW5nIG1lbWJlciBvZiAubmVlZHNf
Y21kcyB0bwo+ICAgICB0c3RfcnVuX2NtZCgpL1NBRkVfUlVOX0NNRCgpKGRvIGNoZWNrIGluIHRo
ZXNlIGZ1bmN0aW9ucykuCj4gICAgIEZvciBleGFtcGxlOgo+ICAgICAtLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gICAgICMgZ3JlcCB0c3RfbmVlZHNfY21k
cyBpbmNsdWRlL3RzdF9jbWQuaAo+ICAgICBleHRlcm4gY29uc3QgY2hhciAqY29uc3QgKnRzdF9u
ZWVkc19jbWRzOwo+Cj4gICAgICMgZ3JlcCAtQjEgdHN0X25lZWRzX2NtZHMgbGliL3RzdF90ZXN0
LmMKPgo+ICAgICBjb25zdCBjaGFyICpjb25zdCAqdHN0X25lZWRzX2NtZHM7Cj4gICAgIC0tCj4g
ICAgIGlmICh0c3RfdGVzdC0+bmVlZHNfY21kcykKPiAgICAgdHN0X25lZWRzX2NtZHMgPSB0c3Rf
dGVzdC0+bmVlZHNfY21kczsKPgo+ICAgICAjIGdyZXAgLUEyICduZWVkc19jbWRzJyB0ZXN0Y2Fz
ZXMva2VybmVsL3N5c2NhbGxzL2FkZF9rZXkvYWRkX2tleTA1LmMKPiAgICAgY29uc3QgY2hhciAq
Y29uc3QgY21kX3VzZXJhZGRbXSA9IHt0c3RfbmVlZHNfY21kc1swXSwgdXNlcm5hbWUsIE5VTEx9
Owo+ICAgICBpbnQgcmM7Cj4KPgo+IEkgZG9uJ3Qgc2VlIGFueSBhZHZhbnRhZ2Ugb2YgaW52b2x2
aW5nIHRoaXMgc3RydWN0IGluIGEgdGVzdCBjYXNlLCBhbmQKPiBpdCBhbHNvIG1ha2VzIHRoaW5n
cyBtb3JlIGNvbXBsaWNhdGVkLgpIaSBMaSwKCkluIGZhY3QsIEkgcGVyZmVyIHRvIHJlbW92ZSAu
bmVlZF9jbWQgYW5kIHVzZSB0c3RfcnVuX2NtZCB3aXRoL3dpdGhvdXQgClRTVF9SVU5fQ01EX0NI
RUNLX0NNRCBkaXJlY3RseS4KQnV0IEkgYW0gbm90IHN1cmUgaWYgaXQgaXMgbmVjZXNzYXJ5IHRv
IGtlZXAgLm5lZWRfY21kIGZvciBtZXRhZGF0YSAKcHJvamVjdC4gIEkgdGhpbmsgd2UgY2FuIGdl
bmVyYXRlIGpzb24gYWJvdXQgcmVzb3VjZSBieSByZWFkaW5nIHN0cnVjdCAKdHN0X3Rlc3Qgb3Ig
b3RoZXIgd2F5cy4KClRoYW5rcywKWGlhbyBZYW5nCgo+Cj4gSU1PLCB0aGUgJy5uZWVkc19jbWRz
JyBzaG91bGQgZG8gY2hlY2sgYW5kIGd1YXJhbnRlZSBhbGwgdGhlIGNtZHMgZXhpc3QuCj4gVGhh
dCdzIGEgaGFyZCByZXF1aXJlbWVudCBmb3IgdGhlIHRlc3QuIElmIGEgc2l0dWF0aW9uIHRoYXQg
dGhlIGNvbW1hbmRzCj4gYXJlIG9ubHkgcGFydCBvZiB0aGUgcmVxdWlyZW1lbnQoc29mdCksIHdl
IGNvdWxkIGF2b2lkIHVzaW5nCj4gJy5uZWVkc19jbWRzJyBpbiB0aGUgdGVzdCBhbmQganVzdCBj
YWxsaW5nIHRzdF9ydW5fY21kKCkgd2l0aG91dCBwYXNzaW5nCj4gVFNUX1JVTl9DTURfQ0hFQ0tf
Q01EIGZsYWcuIFRoaXMgc2F0aXNmaWVzIG1vc3Qgc2l0dWF0aW9ucyB3ZSBoYXZlLCBpdAo+IGlz
IHNhZmUgZW5vdWdoIGFuZCBjaG9vc2FibGUgZm9yIHBlb3BsZS4KPgo+IE9yIG1heWJlIEknbSB3
cm9uZyBoZXJlIHRvbzopLgo+Cj4gLS0KPiBSZWdhcmRzLAo+IExpIFdhbmcKCgoKCi0tIApNYWls
aW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
