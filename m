Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B1FC24CB6F
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Aug 2020 05:34:37 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CA6123C2FCF
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Aug 2020 05:34:36 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 9D04E3C2F97
 for <ltp@lists.linux.it>; Fri, 21 Aug 2020 05:34:33 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id B6F5E1400076
 for <ltp@lists.linux.it>; Fri, 21 Aug 2020 05:34:30 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.76,335,1592841600"; d="scan'208";a="98370260"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 21 Aug 2020 11:34:28 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id B435148990C1;
 Fri, 21 Aug 2020 11:34:23 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 21 Aug 2020 11:34:23 +0800
To: Li Wang <liwang@redhat.com>
References: <1597919168-10702-1-git-send-email-zhufy.jy@cn.fujitsu.com>
 <1597919168-10702-2-git-send-email-zhufy.jy@cn.fujitsu.com>
 <CAEemH2eUd3yCuxt3iawHPXKUSryiJprud3HvneSr=JK_1wFhXg@mail.gmail.com>
 <43a404a1-dd4b-d091-5723-e756604fbbc8@cn.fujitsu.com>
 <CAEemH2fjgYGLD0+JozNcMqv3Eo0eAwK8+BKOCo0QZihUPiP6eg@mail.gmail.com>
 <ebb95886-a352-ab26-2d40-8a3e2e7fa62f@cn.fujitsu.com>
 <CAEemH2dzPyHYdnMJa1A15dLrLrt2m5q5HKo6PY+nrVzBuJjv0g@mail.gmail.com>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <a6f38749-60fd-94b2-ea2c-c7c9f9a6dd1f@cn.fujitsu.com>
Date: Fri, 21 Aug 2020 11:34:20 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAEemH2dzPyHYdnMJa1A15dLrLrt2m5q5HKo6PY+nrVzBuJjv0g@mail.gmail.com>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: B435148990C1.ABE56
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=-1.0 required=7.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
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

SGkgTGkKPiAKPiAKPiBPbiBGcmksIEF1ZyAyMSwgMjAyMCBhdCAxMDoyMiBBTSBZYW5nIFh1IDx4
dXlhbmcyMDE4Lmp5QGNuLmZ1aml0c3UuY29tIAo+IDxtYWlsdG86eHV5YW5nMjAxOC5qeUBjbi5m
dWppdHN1LmNvbT4+IHdyb3RlOgo+IAo+ICAgICAuLi4KPiAgICAgID7CoCDCoCDCoEFsc28sIHdl
IGNhbiB1c2UgdGhlIGN1cnJlbnQgcHJvY2VzcyBpZCBidXQgaXQgbWF5IGhhcyB1bmV4cGVjdGVk
Cj4gICAgICA+wqAgwqAgwqByZXN1bHQKPiAgICAgID7CoCDCoCDCoHdoZW4ga2lsbCBzdWNjZWVk
LiBTbyBmb3JrIGEgY2hpbGQgdG8gdGVzdCBtYXliZSBhIGJldHRlcgo+ICAgICBzb2x1dGlvbi4K
PiAgICAgID4KPiAgICAgID4KPiAgICAgID4gSG1tLCBzb3JyeSBmb3IgdGhlIHVuY2xlYXJlZCBk
ZXNjcmlwdGlvbiwgYWN0dWFsbHkgSSBtZWFudCwgdG8KPiAgICAgdXNlIHJlYWxfcGlkCj4gICAg
ICA+IGluc3RlYWQgb2YgdGhlwqB0Yy0+Y2hpbGRfZmxhZyBkaXJlY3RseSwgdGhlbiBzdGFydCB0
byByZWNsYWltIHRoZQo+ICAgICBjaGlsZAo+ICAgICAgPiB3aGVuIHRoZQo+ICAgICAgPiByZWFs
X3BpZCB0ZXN0IGZpbmlzaGluZy4KPiAgICAgID4KPiAgICAgID4gRG9lcyB0aGlzIGJlbG93IGRp
ZmYgd29yayBmb3IgeW91Pwo+ICAgICBJdCBsb29rcyB3ZWxsLiBCdXQgdGhlIHJlYWxfcGlkIG9u
bHkgdmFsaWQgd2hlbiB0aGUgZmlyc3Qgc3ViIHRlc3QgYW5kCj4gICAgIHRoZSByZWFsIHBpZCBp
cyBlcXVhbHMgdG8gMCB3aGVuIHVzaW5nIC1pIHBhcmFtZXRlcnMgYmVjYXVzZSB3ZSBoYXZlCj4g
ICAgIGtpbGxlZCB0aGlzIGNoaWxkcmVuLgo+IAo+IAo+IFllcywgeW91J3JlIHJpZ2h0Lgo+IEhv
dyBhYm91dCBtb3ZpbmcgdXAgdGhlIHJlYWxfcGlkIGNyZWF0b3IgdG8gdGhlIG1haW4gcHJvY2Vz
cz8gZG9lcyBpdCAKPiB3b3JrIGZvciB5b3U/Cj4gCj4gc3RhdGljIHZvaWQgdmVyaWZ5X2tpbGwo
dW5zaWduZWQgaW50IG4pCj4gewo+ICDCoCDCoCDCoCDCoCBpZiAoIXJlYWxfcGlkKSB7Cj4gIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIHJlYWxfcGlkID0gU0FGRV9GT1JLKCk7Cj4gIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIGlmICghcmVhbF9waWQpCj4gIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIHBhdXNlKCk7Cj4gIMKgIMKgIMKgIMKgIH0KPiAKPiAgwqAgwqAgwqAgwqAg
VEVTVChraWxsKCp0Yy0+cGlkLCB0Yy0+dGVzdF9zaWcpKTsKPiAuLi4KPiAKPiAgwqAgwqAgwqAg
wqAgaWYgKHJlYWxfcGlkKSB7Cj4gIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGNsZWFudXAoKTsK
PiAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcmVhbF9waWQgPSAwOwo+ICDCoCDCoCDCoCDCoCB9
Cj4gCj4gfQo+IApZZXMsIGl0IGxvb2tzIG9rLAo+IAo+ICAgICBGb3IgcGlkID0gMCwgaXQgbWVh
bnPCoCB0aGVuIHNpZyBpcyBzZW50IHRvIGV2ZXJ5IHByb2Nlc3MgaW4gdGhlIHByb2Nlc3MKPiAg
ICAgZ3JvdXAgb2YgdGhlIGNhbGxpbmcgcHJvY2Vzcy7CoCBTbyBpdCBsb29rcyBsaWtlIHdlIHRl
c3QgZGlmZmVyZW50IHRoaW5nCj4gICAgIHdoZW4gdXNpbmcgLWkgcGFyYW1ldGVycy7CoCBXaGF0
IGRvIHlvdSB0aGluayBhYm91dCB0aGlzPwo+IAo+IAo+IEkgZXZlbiB0aGluayBpdCBpcyBhIGdv
b2QgaWRlYSBmb3IgY29kZSBzaW1wbGlmaWNhdGlvbjopLiBJbiB0aGlzIGNhc2UsIAo+IHRoZSBm
aXJzdAo+IHRoZSBzdWJ0ZXN0IGlzIGp1c3QgdG8gdmVyaWZ5IGludmFsaWQgc2lnbmFsIGZvciBr
aWxsKCksIGl0IGRvZXNuJ3QgCj4gbWF0dGVyIHRvIGdvIHdpdGgKPiBraWxsKDAsIGludmFsaWRf
c2lnbmFsKSwgdGhhdCBvbmx5IHRyaWVzIHRvIGtpbGwgdGhlIGN1cnJlbnQgbWFpbiAKPiBwcm9j
ZXNzLiBpc24ndCBpdD8KWWVzLiBJIHRoaW5rIHVzaW5nIGN1cnJlbnQgcHJvY2VzcyBpZCBpbnN0
ZWFkIG9mIDAgaXMgbW9yZSBlYXNpZXIgCmJlY2F1c2UgdGhlIGludmFsaWQgc2lnbmFsIGNhbid0
IGtpbGwgcHJvY2VzcyBmb3JldmVyLgoKc3RhdGljIHZvaWQgc2V0dXAodm9pZCkKewogICAgICAg
ICByZWFsX3BpZCA9IGdldHBpZCgpOwogICAgICAgICBmYWtlX3BpZCA9IHRzdF9nZXRfdW51c2Vk
X3BpZCgpOwogICAgICAgICBpbnRfbWluX3BpZCA9IElOVF9NSU47Cn0KCj4gCj4gSWYgd2UgZ28g
dGhpcyB3YXksIG5vdCBvbmx5IHRoZcKgdGMtPmNoaWxkX2ZsYWcgaXMgbm8gbmVlZGVkLCBidXQg
YWxzbyAKPiBub3QgbmVjZXNzYXJ5Cj4gdG8gZm9yayBhIG5ldyBjaGlsZCB0byBiZSBraWxsZWQu
Cj4gCj4gLS0gCj4gUmVnYXJkcywKPiBMaSBXYW5nCgoKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzog
aHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
