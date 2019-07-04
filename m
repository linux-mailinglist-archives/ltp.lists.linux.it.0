Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B26E5F491
	for <lists+linux-ltp@lfdr.de>; Thu,  4 Jul 2019 10:29:38 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BABC93C1DAE
	for <lists+linux-ltp@lfdr.de>; Thu,  4 Jul 2019 10:29:37 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 20ACE3C1D97
 for <ltp@lists.linux.it>; Thu,  4 Jul 2019 10:29:35 +0200 (CEST)
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 (using TLSv1.1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id DA4216008A2
 for <ltp@lists.linux.it>; Thu,  4 Jul 2019 10:29:33 +0200 (CEST)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
 by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x648TUSB014578
 (version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
 Thu, 4 Jul 2019 01:29:30 -0700 (PDT)
Received: from [128.224.162.188] (128.224.162.188) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
 Thu, 4 Jul 2019 01:29:30 -0700
To: Jan Stancek <jstancek@redhat.com>
References: <dc4e1e30-face-9039-db90-5a6dae2fc2ea@windriver.com>
 <1731168043.30655111.1561720172996.JavaMail.zimbra@redhat.com>
 <77f916ad-58e3-bf0c-e1e7-da8fc3397ba4@windriver.com>
 <818477200.31466413.1562158387201.JavaMail.zimbra@redhat.com>
 <286312662.31605904.1562198532095.JavaMail.zimbra@redhat.com>
 <faeb7464-f0c8-b97e-3b0b-7f38c2e94b99@windriver.com>
 <168662696.31634307.1562228259867.JavaMail.zimbra@redhat.com>
From: "Hongzhi, Song" <hongzhi.song@windriver.com>
Message-ID: <b5d275b1-6c6e-3ee4-ef55-f2d8e263eef8@windriver.com>
Date: Thu, 4 Jul 2019 16:29:26 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <168662696.31634307.1562228259867.JavaMail.zimbra@redhat.com>
Content-Language: en-US
X-Originating-IP: [128.224.162.188]
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] Bug Report: diotest4 fails on mips64
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Ck9uIDcvNC8xOSA0OjE3IFBNLCBKYW4gU3RhbmNlayB3cm90ZToKPgo+IC0tLS0tIE9yaWdpbmFs
IE1lc3NhZ2UgLS0tLS0KPj4gT24gNy80LzE5IDg6MDIgQU0sIEphbiBTdGFuY2VrIHdyb3RlOgo+
Pj4gLS0tLS0gT3JpZ2luYWwgTWVzc2FnZSAtLS0tLQo+Pj4+IC0tLS0tIE9yaWdpbmFsIE1lc3Nh
Z2UgLS0tLS0KPj4+Pj4gVGhhbmtzIGZvciB5b3VyIHdvcmsuCj4+Pj4+Cj4+Pj4+IEkgd2lsbCBi
YWNrcG9ydCB0aGUgcGF0Y2ggdG8gbXkgcHJvamVjdCBhZnRlciBtZXJnZWQuCj4+Pj4gRG9lcyBp
dCBtZWFuLCB0aGF0IHBhdGNoIEkgcG9zdGVkIGZpeGVzIHByb2JsZW0gZm9yIHlvdT8KPj4+Pgo+
Pj4+IERvIHlvdSBoYXZlIGdvb2QvYmFkIGtlcm5lbCB2ZXJzaW9uPyBJIHdhcyBsb29raW5nIGF0
IHJlY2VudAo+Pj4+IHVwc3RyZWFtIGNoYW5nZXMsIGJ1dCBkaWRuJ3Qgc3BvdCBhbnl0aGluZyB0
aGF0IGNvdWxkIGV4cGxhaW4KPj4+PiB0aGF0IEVJTlZBTC4KPj4+IFByb2JsZW0gYXBwZWFycyB0
byBiZSB0aGF0ICJtbWFwLmgiIGRvZXNuJ3QgaW5jbHVkZSAiY29uZmlnLmgiLAo+Pj4gc28gTU1B
UF9HUkFOVUxBUklUWSBlbmRzIHVwIGJlaW5nIGp1c3Qgc2luZ2xlIHBhZ2UuCj4+IFNvcnJ5LCBj
YW4geW91IHRlbGwgbWUgdGhlIHJlbGF0aW9uc2hpcCBiZXR3ZWVuIGNvbmZpZy5oIGFuZAo+PiBN
TUFQX0dSQU5VTEFSSVRZID8KPiBjb25maWd1cmUgZGV0ZWN0cyB0aGF0IHlvdSBoYXZlIHN5cy9z
bWguaCwgd2hpY2ggaXMgcmVjb3JkZWQgaW4gY29uZmlnLmg6Cj4gICAgLyogRGVmaW5lIHRvIDEg
aWYgeW91IGhhdmUgdGhlIDxzeXMvc2htLmg+IGhlYWRlciBmaWxlLiAqLwo+ICAgICNkZWZpbmUg
SEFWRV9TWVNfU0hNX0ggMQo+Cj4gSWYgeW91ciBwbGF0Zm9ybSBoYXMgc2htLmgsIHRoZW4gTU1B
UF9HUkFOVUxBUklUWSBpcyBkZWZpbmUgYXMgU0hNTEJBLAo+IG90aGVyd2lzZSBhcyBzaW5nbGUg
cGFnZS4KPgo+IElmIGxhcGkvbW1hcC5oIGRvZXNuJ3QgaW5jbHVkZSBjb25maWcuaCwgdGhlbiBp
dCdzIGFsd2F5cyB0aGUgbGF0dGVyLAo+IGJlY2F1c2UgSEFWRV9TWVNfU0hNX0ggaXMgdW5kZWZp
bmVkLgo+Cj4+IEkgdGVzdGVkIHNldmVyYWwgdGltZXMgdGhhdCBpbmNsdWRpbmcgImNvbmZpZy5o
IiBpbmRlZWQgZml4ZWQgdGhlIGJ1Zy4KPj4KPj4KPj4+IEZvbGxvd2luZyBmaXhlcyBpdCBmb3Ig
bWUgb24gcWVtdSBlbXVsYXRlZCA1a2MtbWFsdGEsIHJ1bm5pbmcgNS4yLjAtcmM3Ogo+Pj4KPj4+
IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xhcGkvbW1hcC5oIGIvaW5jbHVkZS9sYXBpL21tYXAuaAo+
Pj4gaW5kZXggMTg1NDdjMGQ0Li45OGI2YWRlMWUgMTAwNjQ0Cj4+PiAtLS0gYS9pbmNsdWRlL2xh
cGkvbW1hcC5oCj4+PiArKysgYi9pbmNsdWRlL2xhcGkvbW1hcC5oCj4+PiBAQCAtMTksNiArMTks
OCBAQAo+Pj4gICAgI2lmbmRlZiBMQVBJX01NQVBfSF9fCj4+PiAgICAjZGVmaW5lIExBUElfTU1B
UF9IX18KPj4+Cj4+PiArI2luY2x1ZGUgImNvbmZpZy5oIgo+Pj4gKwo+Pj4gICAgI2lmbmRlZiBN
QVBfSFVHRVRMQgo+Pj4gICAgIyBkZWZpbmUgTUFQX0hVR0VUTEIgMHg0MDAwMAo+Pj4gICAgI2Vu
ZGlmCj4+Pgo+Pj4gYnV0IHN0aWxsLCBwZXJoYXBzIHdlIHNob3VsZCBhbHNvIGRyb3AgdGhhdCBN
QVBfRklYRUQuCj4+Cj4+IEFncmVlIHdpdGggaXQuIENvdWxkIEkgc2VuZCB0aGUgcGF0Y2ggd2l0
aCB5b3VyIHNpZ25lZC1vZmY/Cj4gSSBzZW50IG9uZSB+MjAgbWludXRlcyBhZ28sIHlvdSBzaG91
bGQgYmUgb24gQ0MuCgoKWWVhaCwgSSBzZWUgaXQuIFRoYW5rIHlvdSB2ZXJ5IG11Y2guCgotLUhv
bmd6aGkKCgo+Cj4+IC0tSG9uZ3poaQo+Pgo+Pgo+Pj4+PiAtLUhvbmd6aGkKPj4+Pj4KPj4+Pj4K
Pj4+Pj4KPj4+Pj4gT24gNi8yOC8xOSA3OjA5IFBNLCBKYW4gU3RhbmNlayB3cm90ZToKPj4+Pj4+
IC0tLS0tIE9yaWdpbmFsIE1lc3NhZ2UgLS0tLS0KPj4+Pj4+PiAqTHRwOioKPj4+Pj4+Pgo+Pj4+
Pj4+IGxhdGVzdCBtYXN0ZXIKPj4+Pj4+Pgo+Pj4+Pj4+Cj4+Pj4+Pj4gKktlcm5lbDoqCj4+Pj4+
Pj4KPj4+Pj4+PiBBZnRlciB2NS4xIEFSQ0g9bWlwczY0Cj4+Pj4+Pj4KPj4+Pj4+Pgo+Pj4+Pj4+
ICpFcnJvciBpbmZvOioKPj4+Pj4+Pgo+Pj4+Pj4+IGRpb3Rlc3Q0IDEwIFRCUk9LIDogZGlvdGVz
dDQuYzozNjg6IGNhbid0IG1tYXAgZmlsZTogSW52YWxpZCBhcmd1bWVudAo+Pj4+Pj4+IGRpb3Rl
c3Q0IDExIFRCUk9LIDogZGlvdGVzdDQuYzozNjg6IFJlbWFpbmluZyBjYXNlcyBicm9rZW4KPj4+
Pj4+Pgo+Pj4+Pj4+Cj4+Pj4+Pj4gSSB0aGluayB0aGUgZmlyc3QgYXJndW1lbnQgb2YgbW1hcCBp
cyBpbnZhbGlkLgo+Pj4+Pj4+Cj4+Pj4+Pj4gICAgIMKgwqAgPnNobV9iYXNlID0gKGNoYXIgKiko
KChsb25nKXNicmsoMCkgKyAoc2htc3ogLSAxKSkgJiB+KHNobXN6IC0KPj4+Pj4+PiAgICAgwqDC
oCA+MSkpOwo+Pj4+Pj4+Cj4+Pj4+Pj4gICAgIMKgwqAgPnNobV9iYXNlID0gbW1hcChzaG1fYmFz
ZSwgMHgxMDAwMDAsIFBST1RfUkVBRCB8IFBST1RfV1JJVEUsCj4+Pj4+PiBJIGRvbid0IHNlZSBh
bnkgbm90ZSB3aHkgdGhhdCBtbWFwIG5lZWRzIHRvIGJlIE1BUF9GSVhFRC4gSSdkIGRyb3AgaXQs
Cj4+Pj4+PiBsZXQga2VybmVsIHBpY2sgYW4gYWRkcmVzczoKPj4+Pj4+Cj4+Pj4+PiBkaWZmIC0t
Z2l0IGEvdGVzdGNhc2VzL2tlcm5lbC9pby9kaXJlY3RfaW8vZGlvdGVzdDQuYwo+Pj4+Pj4gYi90
ZXN0Y2FzZXMva2VybmVsL2lvL2RpcmVjdF9pby9kaW90ZXN0NC5jCj4+Pj4+PiBpbmRleCBlNDYx
NmU0MDBhYmQuLmJmMjAwY2Q0MWEyNyAxMDA2NDQKPj4+Pj4+IC0tLSBhL3Rlc3RjYXNlcy9rZXJu
ZWwvaW8vZGlyZWN0X2lvL2Rpb3Rlc3Q0LmMKPj4+Pj4+ICsrKyBiL3Rlc3RjYXNlcy9rZXJuZWwv
aW8vZGlyZWN0X2lvL2Rpb3Rlc3Q0LmMKPj4+Pj4+IEBAIC0zNTIsMTggKzM1MiwxNCBAQCBpbnQg
bWFpbihpbnQgYXJnYywgY2hhciAqYXJndltdKQo+Pj4+Pj4gICAgICAgICAgICB0b3RhbCsrOwo+
Pj4+Pj4KPj4+Pj4+ICAgICAgICAgICAgLyogVGVzdC0xMDogcmVhZCwgd3JpdGUgdG8gYSBtbWFw
ZWQgZmlsZSAqLwo+Pj4+Pj4gLSAgICAgICBzaG1fYmFzZSA9IChjaGFyICopKCgobG9uZylzYnJr
KDApICsgKHNobXN6IC0gMSkpICYgfihzaG1zeiAtCj4+Pj4+PiAxKSk7Cj4+Pj4+PiAtICAgICAg
IGlmIChzaG1fYmFzZSA9PSBOVUxMKSB7Cj4+Pj4+PiAtICAgICAgICAgICAgICAgdHN0X2Jya20o
VEJST0ssIGNsZWFudXAsICJzYnJrIGZhaWxlZDogJXMiLAo+Pj4+Pj4gc3RyZXJyb3IoZXJybm8p
KTsKPj4+Pj4+IC0gICAgICAgfQo+Pj4+Pj4gICAgICAgICAgICBvZmZzZXQgPSA0MDk2Owo+Pj4+
Pj4gICAgICAgICAgICBjb3VudCA9IGJ1ZnNpemU7Cj4+Pj4+PiAgICAgICAgICAgIGlmICgoZmQg
PSBvcGVuKGZpbGVuYW1lLCBPX0RJUkVDVCB8IE9fUkRXUikpIDwgMCkgewo+Pj4+Pj4gICAgICAg
ICAgICAgICAgICAgIHRzdF9icmttKFRCUk9LLCBjbGVhbnVwLCAiY2FuJ3Qgb3BlbiAlczogJXMi
LAo+Pj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZpbGVuYW1lLCBzdHJlcnJvcihl
cnJubykpOwo+Pj4+Pj4gICAgICAgICAgICB9Cj4+Pj4+PiAtICAgICAgIHNobV9iYXNlID0gbW1h
cChzaG1fYmFzZSwgMHgxMDAwMDAsIFBST1RfUkVBRCB8IFBST1RfV1JJVEUsCj4+Pj4+PiAtICAg
ICAgICAgICAgICAgICAgICAgICBNQVBfU0hBUkVEIHwgTUFQX0ZJWEVELCBmZCwgMCk7Cj4+Pj4+
PiArICAgICAgIHNobV9iYXNlID0gbW1hcCgwLCAweDEwMDAwMCwgUFJPVF9SRUFEIHwgUFJPVF9X
UklURSwKPj4+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgIE1BUF9TSEFSRUQsIGZkLCAwKTsK
Pj4+Pj4+ICAgICAgICAgICAgaWYgKHNobV9iYXNlID09IChjYWRkcl90KSAtIDEpIHsKPj4+Pj4+
ICAgICAgICAgICAgICAgICAgICB0c3RfYnJrbShUQlJPSywgY2xlYW51cCwgImNhbid0IG1tYXAg
ZmlsZTogJXMiLAo+Pj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cmVycm9yKGVy
cm5vKSk7Cj4+Pj4+Pgo+Pj4+IC0tCj4+Pj4gTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlz
dHMubGludXguaXQvbGlzdGluZm8vbHRwCj4+Pj4KCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0
cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
