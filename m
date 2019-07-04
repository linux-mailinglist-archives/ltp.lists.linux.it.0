Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A6BD85F404
	for <lists+linux-ltp@lfdr.de>; Thu,  4 Jul 2019 09:45:00 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 78C413C1DAC
	for <lists+linux-ltp@lfdr.de>; Thu,  4 Jul 2019 09:45:00 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 34F5D3C1D98
 for <ltp@lists.linux.it>; Thu,  4 Jul 2019 09:44:58 +0200 (CEST)
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 3244120135F
 for <ltp@lists.linux.it>; Thu,  4 Jul 2019 09:44:55 +0200 (CEST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
 [147.11.189.40])
 by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x647iGhL025559
 (version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
 Thu, 4 Jul 2019 00:44:31 -0700
Received: from [128.224.162.188] (128.224.162.188) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
 Thu, 4 Jul 2019 00:44:07 -0700
To: Jan Stancek <jstancek@redhat.com>
References: <dc4e1e30-face-9039-db90-5a6dae2fc2ea@windriver.com>
 <1731168043.30655111.1561720172996.JavaMail.zimbra@redhat.com>
 <77f916ad-58e3-bf0c-e1e7-da8fc3397ba4@windriver.com>
 <818477200.31466413.1562158387201.JavaMail.zimbra@redhat.com>
 <286312662.31605904.1562198532095.JavaMail.zimbra@redhat.com>
From: "Hongzhi, Song" <hongzhi.song@windriver.com>
Message-ID: <faeb7464-f0c8-b97e-3b0b-7f38c2e94b99@windriver.com>
Date: Thu, 4 Jul 2019 15:44:04 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <286312662.31605904.1562198532095.JavaMail.zimbra@redhat.com>
Content-Language: en-US
X-Originating-IP: [128.224.162.188]
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
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

Ck9uIDcvNC8xOSA4OjAyIEFNLCBKYW4gU3RhbmNlayB3cm90ZToKPgo+IC0tLS0tIE9yaWdpbmFs
IE1lc3NhZ2UgLS0tLS0KPj4gLS0tLS0gT3JpZ2luYWwgTWVzc2FnZSAtLS0tLQo+Pj4gVGhhbmtz
IGZvciB5b3VyIHdvcmsuCj4+Pgo+Pj4gSSB3aWxsIGJhY2twb3J0IHRoZSBwYXRjaCB0byBteSBw
cm9qZWN0IGFmdGVyIG1lcmdlZC4KPj4gRG9lcyBpdCBtZWFuLCB0aGF0IHBhdGNoIEkgcG9zdGVk
IGZpeGVzIHByb2JsZW0gZm9yIHlvdT8KPj4KPj4gRG8geW91IGhhdmUgZ29vZC9iYWQga2VybmVs
IHZlcnNpb24/IEkgd2FzIGxvb2tpbmcgYXQgcmVjZW50Cj4+IHVwc3RyZWFtIGNoYW5nZXMsIGJ1
dCBkaWRuJ3Qgc3BvdCBhbnl0aGluZyB0aGF0IGNvdWxkIGV4cGxhaW4KPj4gdGhhdCBFSU5WQUwu
Cj4gUHJvYmxlbSBhcHBlYXJzIHRvIGJlIHRoYXQgIm1tYXAuaCIgZG9lc24ndCBpbmNsdWRlICJj
b25maWcuaCIsCj4gc28gTU1BUF9HUkFOVUxBUklUWSBlbmRzIHVwIGJlaW5nIGp1c3Qgc2luZ2xl
IHBhZ2UuCgpTb3JyeSwgY2FuIHlvdSB0ZWxsIG1lIHRoZSByZWxhdGlvbnNoaXAgYmV0d2VlbiBj
b25maWcuaCBhbmQgCk1NQVBfR1JBTlVMQVJJVFkgPwoKSSB0ZXN0ZWQgc2V2ZXJhbCB0aW1lcyB0
aGF0IGluY2x1ZGluZyAiY29uZmlnLmgiIGluZGVlZCBmaXhlZCB0aGUgYnVnLgoKCj4KPiBGb2xs
b3dpbmcgZml4ZXMgaXQgZm9yIG1lIG9uIHFlbXUgZW11bGF0ZWQgNWtjLW1hbHRhLCBydW5uaW5n
IDUuMi4wLXJjNzoKPgo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xhcGkvbW1hcC5oIGIvaW5jbHVk
ZS9sYXBpL21tYXAuaAo+IGluZGV4IDE4NTQ3YzBkNC4uOThiNmFkZTFlIDEwMDY0NAo+IC0tLSBh
L2luY2x1ZGUvbGFwaS9tbWFwLmgKPiArKysgYi9pbmNsdWRlL2xhcGkvbW1hcC5oCj4gQEAgLTE5
LDYgKzE5LDggQEAKPiAgICNpZm5kZWYgTEFQSV9NTUFQX0hfXwo+ICAgI2RlZmluZSBMQVBJX01N
QVBfSF9fCj4KPiArI2luY2x1ZGUgImNvbmZpZy5oIgo+ICsKPiAgICNpZm5kZWYgTUFQX0hVR0VU
TEIKPiAgICMgZGVmaW5lIE1BUF9IVUdFVExCIDB4NDAwMDAKPiAgICNlbmRpZgo+Cj4gYnV0IHN0
aWxsLCBwZXJoYXBzIHdlIHNob3VsZCBhbHNvIGRyb3AgdGhhdCBNQVBfRklYRUQuCgoKQWdyZWUg
d2l0aCBpdC4gQ291bGQgSSBzZW5kIHRoZSBwYXRjaCB3aXRoIHlvdXIgc2lnbmVkLW9mZj8KCi0t
SG9uZ3poaQoKCj4KPj4+Cj4+PiAtLUhvbmd6aGkKPj4+Cj4+Pgo+Pj4KPj4+IE9uIDYvMjgvMTkg
NzowOSBQTSwgSmFuIFN0YW5jZWsgd3JvdGU6Cj4+Pj4gLS0tLS0gT3JpZ2luYWwgTWVzc2FnZSAt
LS0tLQo+Pj4+PiAqTHRwOioKPj4+Pj4KPj4+Pj4gbGF0ZXN0IG1hc3Rlcgo+Pj4+Pgo+Pj4+Pgo+
Pj4+PiAqS2VybmVsOioKPj4+Pj4KPj4+Pj4gQWZ0ZXIgdjUuMSBBUkNIPW1pcHM2NAo+Pj4+Pgo+
Pj4+Pgo+Pj4+PiAqRXJyb3IgaW5mbzoqCj4+Pj4+Cj4+Pj4+IGRpb3Rlc3Q0IDEwIFRCUk9LIDog
ZGlvdGVzdDQuYzozNjg6IGNhbid0IG1tYXAgZmlsZTogSW52YWxpZCBhcmd1bWVudAo+Pj4+PiBk
aW90ZXN0NCAxMSBUQlJPSyA6IGRpb3Rlc3Q0LmM6MzY4OiBSZW1haW5pbmcgY2FzZXMgYnJva2Vu
Cj4+Pj4+Cj4+Pj4+Cj4+Pj4+IEkgdGhpbmsgdGhlIGZpcnN0IGFyZ3VtZW50IG9mIG1tYXAgaXMg
aW52YWxpZC4KPj4+Pj4KPj4+Pj4gICAgwqDCoCA+c2htX2Jhc2UgPSAoY2hhciAqKSgoKGxvbmcp
c2JyaygwKSArIChzaG1zeiAtIDEpKSAmIH4oc2htc3ogLSAxKSk7Cj4+Pj4+Cj4+Pj4+ICAgIMKg
wqAgPnNobV9iYXNlID0gbW1hcChzaG1fYmFzZSwgMHgxMDAwMDAsIFBST1RfUkVBRCB8IFBST1Rf
V1JJVEUsCj4+Pj4gSSBkb24ndCBzZWUgYW55IG5vdGUgd2h5IHRoYXQgbW1hcCBuZWVkcyB0byBi
ZSBNQVBfRklYRUQuIEknZCBkcm9wIGl0LAo+Pj4+IGxldCBrZXJuZWwgcGljayBhbiBhZGRyZXNz
Ogo+Pj4+Cj4+Pj4gZGlmZiAtLWdpdCBhL3Rlc3RjYXNlcy9rZXJuZWwvaW8vZGlyZWN0X2lvL2Rp
b3Rlc3Q0LmMKPj4+PiBiL3Rlc3RjYXNlcy9rZXJuZWwvaW8vZGlyZWN0X2lvL2Rpb3Rlc3Q0LmMK
Pj4+PiBpbmRleCBlNDYxNmU0MDBhYmQuLmJmMjAwY2Q0MWEyNyAxMDA2NDQKPj4+PiAtLS0gYS90
ZXN0Y2FzZXMva2VybmVsL2lvL2RpcmVjdF9pby9kaW90ZXN0NC5jCj4+Pj4gKysrIGIvdGVzdGNh
c2VzL2tlcm5lbC9pby9kaXJlY3RfaW8vZGlvdGVzdDQuYwo+Pj4+IEBAIC0zNTIsMTggKzM1Miwx
NCBAQCBpbnQgbWFpbihpbnQgYXJnYywgY2hhciAqYXJndltdKQo+Pj4+ICAgICAgICAgICB0b3Rh
bCsrOwo+Pj4+Cj4+Pj4gICAgICAgICAgIC8qIFRlc3QtMTA6IHJlYWQsIHdyaXRlIHRvIGEgbW1h
cGVkIGZpbGUgKi8KPj4+PiAtICAgICAgIHNobV9iYXNlID0gKGNoYXIgKikoKChsb25nKXNicmso
MCkgKyAoc2htc3ogLSAxKSkgJiB+KHNobXN6IC0KPj4+PiAxKSk7Cj4+Pj4gLSAgICAgICBpZiAo
c2htX2Jhc2UgPT0gTlVMTCkgewo+Pj4+IC0gICAgICAgICAgICAgICB0c3RfYnJrbShUQlJPSywg
Y2xlYW51cCwgInNicmsgZmFpbGVkOiAlcyIsCj4+Pj4gc3RyZXJyb3IoZXJybm8pKTsKPj4+PiAt
ICAgICAgIH0KPj4+PiAgICAgICAgICAgb2Zmc2V0ID0gNDA5NjsKPj4+PiAgICAgICAgICAgY291
bnQgPSBidWZzaXplOwo+Pj4+ICAgICAgICAgICBpZiAoKGZkID0gb3BlbihmaWxlbmFtZSwgT19E
SVJFQ1QgfCBPX1JEV1IpKSA8IDApIHsKPj4+PiAgICAgICAgICAgICAgICAgICB0c3RfYnJrbShU
QlJPSywgY2xlYW51cCwgImNhbid0IG9wZW4gJXM6ICVzIiwKPj4+PiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBmaWxlbmFtZSwgc3RyZXJyb3IoZXJybm8pKTsKPj4+PiAgICAgICAgICAgfQo+
Pj4+IC0gICAgICAgc2htX2Jhc2UgPSBtbWFwKHNobV9iYXNlLCAweDEwMDAwMCwgUFJPVF9SRUFE
IHwgUFJPVF9XUklURSwKPj4+PiAtICAgICAgICAgICAgICAgICAgICAgICBNQVBfU0hBUkVEIHwg
TUFQX0ZJWEVELCBmZCwgMCk7Cj4+Pj4gKyAgICAgICBzaG1fYmFzZSA9IG1tYXAoMCwgMHgxMDAw
MDAsIFBST1RfUkVBRCB8IFBST1RfV1JJVEUsCj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAg
TUFQX1NIQVJFRCwgZmQsIDApOwo+Pj4+ICAgICAgICAgICBpZiAoc2htX2Jhc2UgPT0gKGNhZGRy
X3QpIC0gMSkgewo+Pj4+ICAgICAgICAgICAgICAgICAgIHRzdF9icmttKFRCUk9LLCBjbGVhbnVw
LCAiY2FuJ3QgbW1hcCBmaWxlOiAlcyIsCj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
c3RyZXJyb3IoZXJybm8pKTsKPj4+Pgo+PiAtLQo+PiBNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6
Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAKPj4KCi0tIApNYWlsaW5nIGxpc3QgaW5mbzog
aHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
