Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 429D0686D3
	for <lists+linux-ltp@lfdr.de>; Mon, 15 Jul 2019 12:07:35 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 161583C1D18
	for <lists+linux-ltp@lfdr.de>; Mon, 15 Jul 2019 12:07:35 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id B41793C1CE4
 for <ltp@lists.linux.it>; Mon, 15 Jul 2019 12:07:31 +0200 (CEST)
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 (using TLSv1.1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 0AFCC6012D4
 for <ltp@lists.linux.it>; Mon, 15 Jul 2019 12:07:30 +0200 (CEST)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
 by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x6FA7TIO026421
 (version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
 Mon, 15 Jul 2019 03:07:29 -0700 (PDT)
Received: from [128.224.162.188] (128.224.162.188) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
 Mon, 15 Jul 2019 03:07:28 -0700
To: Jan Stancek <jstancek@redhat.com>
References: <1562826026-158569-1-git-send-email-hongzhi.song@windriver.com>
 <408194681.32599099.1562831328308.JavaMail.zimbra@redhat.com>
 <c0c07134-f5a8-b4d3-c210-c58c36653423@windriver.com>
 <1691784527.32812965.1562915669160.JavaMail.zimbra@redhat.com>
 <c15e6a0a-34dd-100a-2a42-066a1e23f206@windriver.com>
 <408284891.32847796.1562926002494.JavaMail.zimbra@redhat.com>
From: "Hongzhi, Song" <hongzhi.song@windriver.com>
Message-ID: <18a7a573-f97a-da1d-db0e-cff8e60b23af@windriver.com>
Date: Mon, 15 Jul 2019 18:07:25 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <408284891.32847796.1562926002494.JavaMail.zimbra@redhat.com>
Content-Language: en-US
X-Originating-IP: [128.224.162.188]
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V2] getrlimit03: adjust a bit of code to
 compatiable with mips32
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

Ck9uIDcvMTIvMTkgNjowNiBQTSwgSmFuIFN0YW5jZWsgd3JvdGU6Cj4KPiAtLS0tLSBPcmlnaW5h
bCBNZXNzYWdlIC0tLS0tCj4+IE9uIDcvMTIvMTkgMzoxNCBQTSwgSmFuIFN0YW5jZWsgd3JvdGU6
Cj4+PiAtLS0tLSBPcmlnaW5hbCBNZXNzYWdlIC0tLS0tCj4+Pj4gT24gNy8xMS8xOSAzOjQ4IFBN
LCBKYW4gU3RhbmNlayB3cm90ZToKPj4+Pj4gLS0tLS0gT3JpZ2luYWwgTWVzc2FnZSAtLS0tLQo+
Pj4+Pj4gRXJyb3IgaW5mbzoKPj4+Pj4+IGdldHJsaW1pdDAzLmM6MTA0OiBGQUlMOiBfX05SX3By
bGltaXQ2NCgwKSBoYWQgcmxpbV9jdXIgPQo+Pj4+Pj4gZmZmZmZmZmZmZmZmZmZmZiBidXQgX19O
Ul9nZXRybGltaXQoMCkgaGFkIHJsaW1fY3VyID0gN2ZmZmZmZmYKPj4+Pj4+Cj4+Pj4+PiBBY2Nv
cmRpbmcgdG8ga2VybmVsIGNvZGU6IFthcmNoL21pcHMvaW5jbHVkZS91YXBpL2FzbS9yZXNvdXJj
ZS5oXQo+Pj4+Pj4gUkxJTV9JTkZJTklUWSBpcyBzZXQgdG8gMHg3ZmZmZmZmZlVMIGluc3RlYWQg
b2YgVUxPTkdfTUFYIG9uIG1pcHMzMi4KPj4+Pj4+Cj4+Pj4+PiAvKgo+Pj4+Pj4gICAgICogU3VT
IHNheXMgbGltaXRzIGhhdmUgdG8gYmUgdW5zaWduZWQuCj4+Pj4+PiAgICAgKiBXaGljaCBtYWtl
cyBhIHRvbiBtb3JlIHNlbnNlIGFueXdheSwKPj4+Pj4+ICAgICAqIGJ1dCB3ZSBrZWVwIHRoZSBv
bGQgdmFsdWUgb24gTUlQUzMyLAo+Pj4+Pj4gICAgICogZm9yIGNvbXBhdGliaWxpdHk6Cj4+Pj4+
PiAgICAgKi8KPj4+Pj4+ICNpZm5kZWYgX19taXBzNjQKPj4+Pj4+ICMgZGVmaW5lIFJMSU1fSU5G
SU5JVFkgICAgICAweDdmZmZmZmZmVUwKPj4+Pj4+ICNlbmRpZgo+Pj4+Pj4KPj4+Pj4+IEFkZGlu
ZyBjb25kaXRpb25hbCBzdGF0ZW1lbnQgYWJvdXQgbWlwcyB0byBmaXggdGhpcy4KPj4+Pj4+Cj4+
Pj4+PiBTaWduZWQtb2ZmLWJ5OiBIb25nemhpLlNvbmcgPGhvbmd6aGkuc29uZ0B3aW5kcml2ZXIu
Y29tPgo+Pj4+Pj4gLS0tCj4+Pj4+PiAgICAgdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9nZXRy
bGltaXQvZ2V0cmxpbWl0MDMuYyB8IDEwICsrKysrKysrLS0KPj4+Pj4+ICAgICAxIGZpbGUgY2hh
bmdlZCwgOCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Pj4+Pj4KPj4+Pj4+IGRpZmYg
LS1naXQgYS90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2dldHJsaW1pdC9nZXRybGltaXQwMy5j
Cj4+Pj4+PiBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvZ2V0cmxpbWl0L2dldHJsaW1pdDAz
LmMKPj4+Pj4+IGluZGV4IGU0ZDU2YzQuLjE5MDM1NTggMTAwNjQ0Cj4+Pj4+PiAtLS0gYS90ZXN0
Y2FzZXMva2VybmVsL3N5c2NhbGxzL2dldHJsaW1pdC9nZXRybGltaXQwMy5jCj4+Pj4+PiArKysg
Yi90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2dldHJsaW1pdC9nZXRybGltaXQwMy5jCj4+Pj4+
PiBAQCAtNjEsNyArNjEsMTMgQEAgc3RydWN0IHJsaW1pdF91bG9uZyB7Cj4+Pj4+PiAgICAgCXVu
c2lnbmVkIGxvbmcgcmxpbV9jdXI7Cj4+Pj4+PiAgICAgCXVuc2lnbmVkIGxvbmcgcmxpbV9tYXg7
Cj4+Pj4+PiAgICAgfTsKPj4+Pj4+ICsjaWZkZWYgX19taXBzCj4+Pj4+PiArI2lmbmRlZiBfX21p
cHM2NAo+Pj4+Pj4gK2NvbnN0IHVuc2lnbmVkIGxvbmcgUkxJTV9JTkZJTklUWV9VTCA9IDB4N2Zm
ZmZmZmZVTDsKPj4+Pj4+ICsjZWxzZQo+Pj4+Pj4gICAgIGNvbnN0IHVuc2lnbmVkIGxvbmcgUkxJ
TV9JTkZJTklUWV9VTCA9IFVMT05HX01BWDsKPj4+Pj4+ICsjZW5kaWYKPj4+Pj4+ICsjZW5kaWYK
Pj4+Pj4gSGksCj4+Pj4+Cj4+Pj4+IFRoaXMgd2lsbCBicmVhayBldmVyeSBvdGhlciBhcmNoLCBi
ZWNhdXNlIGl0J3Mgbm93IHVuZGVmaW5lZCBldmVyeXdoZXJlCj4+Pj4+IGV4Y2VwdCBtaXBzLgo+
Pj4+IElzIHRoZXJlIGEgZ29vZCB3YXkgdG8gZmlsdGVyIG1pcHMzMj8KPj4+IE1heWJlIHNvbWV0
aGluZyBsaWtlOgo+Pj4KPj4+ICNpbmNsdWRlICJsYXBpL2FiaXNpemUuaCIKPj4+Cj4+PiAjaWYg
ZGVmaW5lZChfX21pcHNfXykgJiYgZGVmaW5lZChUU1RfQUJJMzIpCj4+PiBjb25zdCB1bnNpZ25l
ZCBsb25nIFJMSU1fSU5GSU5JVFlfVUwgPSAweDdmZmZmZmZmVUw7Cj4+PiAjZWxzZQo+Pj4gY29u
c3QgdW5zaWduZWQgbG9uZyBSTElNX0lORklOSVRZX1VMID0gVUxPTkdfTUFYOwo+Pj4gI2VuZGlm
Cj4+Cj4+IFRTVF9BQkkzMiBsb29rcyBsaWtlIG5vdCB3b3JrCj4gQ2FuIHlvdSBlbGFib3JhdGU/
CgoKVGhhbmtzIGZvciB5b3VyIHBhdGllbnQgaW5zdHJ1Y3Rpb24uCgpOb3cgaXQgcGFzc2VzIHdp
dGggeW91ciBzdWdnZXN0aW9uLgoKUHJldmlvdXNseSwgbXkgbHRwIHByb2plY3QgaXMgdG9vIG9s
ZCB0byBtaXNzaW5nIGxhcGkvYWJpc2l6ZS5oLgoKSSBoYXZlIHNlbnQgcGF0Y2gtdjQsIHBsZWFz
ZSByZXZpZXcgaXQuCgoKLS1Ib25nemhpCgoKPgo+PiAsIGFuZCBJIHNlbnQgcGF0Y2gtVjMgdXNp
bmcgX19taXBzIGFuZCBfX21pcHM2NC4KPj4KPj4gLS1Ib25nemhpCj4+Cj4+Cj4+Pj4gSSB0cmll
ZAo+Pj4+Cj4+Pj4gICAgwqA2NSAjaWZkZWYgX19taXBzCj4+Pj4gICAgwqA2NiAjaWZuZGVmIF9f
bWlwczY0Cj4+Pj4gICAgwqA2NyBjb25zdCB1bnNpZ25lZCBsb25nIFJMSU1fSU5GSU5JVFlfVUwg
PSAweDdmZmZmZmZmVUw7Cj4+Pj4gICAgwqA2OCAjZW5kaWYKPj4+PiAgICDCoDY5IGNvbnN0IHVu
c2lnbmVkIGxvbmcgUkxJTV9JTkZJTklUWV9VTCA9IFVMT05HX01BWDsKPj4+PiAgICDCoDcwICNl
bHNlCj4+Pj4gICAgwqA3MSBjb25zdCB1bnNpZ25lZCBsb25nIFJMSU1fSU5GSU5JVFlfVUwgPSBV
TE9OR19NQVg7Cj4+Pj4gICAgwqA3MiAjZW5kaWYKPj4+Pgo+Pj4+IGJ1dCBtaXBzMzIgdGhpbmtz
IHRoZSBSTElNX0lORklOSVRZX1VMIG1pY3JvIGlzIHJlZGVmaW5lZC4KPj4+Pgo+Pj4+Cj4+Pj4+
PiAgICAgCj4+Pj4+PiAgICAgc3RhdGljIGludCBnZXRybGltaXRfdWxvbmcoaW50IHJlc291cmNl
LCBzdHJ1Y3QgcmxpbWl0X3Vsb25nICpybGltKQo+Pj4+Pj4gICAgIHsKPj4+Pj4+IEBAIC0xMDEs
OCArMTA3LDggQEAgc3RhdGljIGludCBjb21wYXJlX3U2NF91bG9uZyhpbnQgcmVzb3VyY2UsIHVp
bnQ2NF90Cj4+Pj4+PiB2YWxfdTY0LAo+Pj4+Pj4gICAgIHsKPj4+Pj4+ICAgICAJaWYgKCh2YWxf
dTY0ID4gUkxJTV9JTkZJTklUWV9VTCAmJiB2YWxfdWwgIT0gUkxJTV9JTkZJTklUWV9VTCkgfHwK
Pj4+Pj4+ICAgICAJICAgICh2YWxfdTY0IDw9IFJMSU1fSU5GSU5JVFlfVUwgJiYgdmFsX3VsICE9
IHZhbF91NjQpKSB7Cj4+Pj4+PiAtCQl0c3RfcmVzKFRGQUlMLCAiX19OUl9wcmxpbWl0NjQoJWQp
IGhhZCAlcyA9ICUiIFBSSXg2NCAiIGJ1dCAiCj4+Pj4+PiBfX05SX2dldHJsaW1pdF91bG9uZ19z
dHIgIiglZCkgaGFkICVzID0gJWx4IiwKPj4+Pj4+IC0JCQlyZXNvdXJjZSwga2luZCwgdmFsX3U2
NCwKPj4+Pj4+ICsJCXRzdF9yZXMoVEZBSUwsICJTSUdORURfR0VUUkxJTUlUID0gJWQgX19XT1JE
U0laRSAlZCBVTE9OR19NQVggPSAlbHUKPj4+Pj4+IFJMSU1fSU5GSU5JVFlfVUwgPSAlbHUgX19O
Ul9wcmxpbWl0NjQoJWQpIGhhZCAlcyA9ICUiIFBSSXg2NCAiIGJ1dCAiCj4+Pj4+PiBfX05SX2dl
dHJsaW1pdF91bG9uZ19zdHIgIiglZCkgaGFkICVzID0gJWx4IiwKPj4+Pj4+ICsJCQlTSUdORURf
R0VUUkxJTUlULCBfX1dPUkRTSVpFLCBVTE9OR19NQVgsIFJMSU1fSU5GSU5JVFlfVUwsIHJlc291
cmNlLAo+Pj4+PiBJIHN1Z2dlc3QgdG8gc3BsaXQgaXQgaW50byBhbm90aGVyIHRzdF9yZXMoKSBt
ZXNzYWdlLCBsaW5lIGFib3ZlIGlzCj4+Pj4+IG5lYXJseQo+Pj4+PiAyMDAgY2hhcmFjdGVycy4K
Pj4+PiBTb3JyeSwgSSBzaG91bGRuJ3QgYXBwZW5kIGRlYnVnIGNvZGUgdG8gcGF0Y2guCj4+Pj4K
Pj4+PiAtLUhvbmd6aGkKPj4+Pgo+Pj4+Cj4+Pj4+IFJlZ2FyZHMsCj4+Pj4+IEphbgo+Pj4+Pgo+
Pj4+Pj4ga2luZCwgdmFsX3U2NCwKPj4+Pj4+ICAgICAJCQlyZXNvdXJjZSwga2luZCwgdmFsX3Vs
KTsKPj4+Pj4+ICAgICAJCXJldHVybiAtMTsKPj4+Pj4+ICAgICAJfQo+Pj4+Pj4gLS0KPj4+Pj4+
IDIuOC4xCj4+Pj4+Pgo+Pj4+Pj4KPj4+Pj4+IC0tCj4+Pj4+PiBNYWlsaW5nIGxpc3QgaW5mbzog
aHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAKPj4+Pj4+CgotLSAKTWFpbGluZyBs
aXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
