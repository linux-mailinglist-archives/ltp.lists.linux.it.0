Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 73BE1220165
	for <lists+linux-ltp@lfdr.de>; Wed, 15 Jul 2020 02:41:17 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F3C133C4F8E
	for <lists+linux-ltp@lfdr.de>; Wed, 15 Jul 2020 02:41:16 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 505973C03B1
 for <ltp@lists.linux.it>; Wed, 15 Jul 2020 02:41:12 +0200 (CEST)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id EDEF4600EAE
 for <ltp@lists.linux.it>; Wed, 15 Jul 2020 02:41:11 +0200 (CEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06F0WkKt022564; Tue, 14 Jul 2020 20:41:09 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3298wv3662-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Jul 2020 20:41:09 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06F0LPDi006626;
 Wed, 15 Jul 2020 00:41:07 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma02fra.de.ibm.com with ESMTP id 327527ux52-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Jul 2020 00:41:07 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06F0f55N28377566
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Jul 2020 00:41:05 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 18FDC11C04C;
 Wed, 15 Jul 2020 00:41:05 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5247E11C052;
 Wed, 15 Jul 2020 00:41:04 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.85.155.184])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 15 Jul 2020 00:41:04 +0000 (GMT)
Message-ID: <1594773663.12900.215.camel@linux.ibm.com>
From: Mimi Zohar <zohar@linux.ibm.com>
To: Lachlan Sneff <t-josne@linux.microsoft.com>, pvorel@suse.cz,
 nramas@linux.microsoft.com, ltp@lists.linux.it
Date: Tue, 14 Jul 2020 20:41:03 -0400
In-Reply-To: <20200626021126.56760-3-t-josne@linux.microsoft.com>
References: <20200626021126.56760-1-t-josne@linux.microsoft.com>
 <20200626021126.56760-3-t-josne@linux.microsoft.com>
X-Mailer: Evolution 3.20.5 (3.20.5-1.fc24) 
Mime-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-14_09:2020-07-14,
 2020-07-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 adultscore=0
 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0 mlxscore=0
 mlxlogscore=999 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2007150001
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 2/2] IMA: Add a test to verify importing a
 certificate into keyring
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
Cc: balajib@linux.microsoft.com, linux-integrity@vger.kernel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

T24gVGh1LCAyMDIwLTA2LTI1IGF0IDIyOjExIC0wNDAwLCBMYWNobGFuIFNuZWZmIHdyb3RlOgo+
IEFkZCBhbiBJTUEgbWVhc3VyZW1lbnQgdGVzdCB0aGF0IHZlcmlmaWVzIHRoYXQgYW4geDUwOSBj
ZXJ0aWZpY2F0ZQo+IGNhbiBiZSBpbXBvcnRlZCBpbnRvIHRoZSAuaW1hIGtleXJpbmcgYW5kIG1l
YXN1cmVkIGNvcnJlY3RseS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBMYWNobGFuIFNuZWZmIDx0LWpv
c25lQGxpbnV4Lm1pY3Jvc29mdC5jb20+Cj4gLS0tCj4gIC4uLi9rZXJuZWwvc2VjdXJpdHkvaW50
ZWdyaXR5L2ltYS9SRUFETUUubWQgICB8IDIyICsrKysrKysrKysKPiAgLi4uL3NlY3VyaXR5L2lu
dGVncml0eS9pbWEvdGVzdHMvaW1hX2tleXMuc2ggIHwgNDQgKysrKysrKysrKysrKysrKysrLQo+
ICAyIGZpbGVzIGNoYW5nZWQsIDY0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4g
ZGlmZiAtLWdpdCBhL3Rlc3RjYXNlcy9rZXJuZWwvc2VjdXJpdHkvaW50ZWdyaXR5L2ltYS9SRUFE
TUUubWQgYi90ZXN0Y2FzZXMva2VybmVsL3NlY3VyaXR5L2ludGVncml0eS9pbWEvUkVBRE1FLm1k
Cj4gaW5kZXggMTZhMWY0OGMzLi45ZTY3OTAzMDYgMTAwNjQ0Cj4gLS0tIGEvdGVzdGNhc2VzL2tl
cm5lbC9zZWN1cml0eS9pbnRlZ3JpdHkvaW1hL1JFQURNRS5tZAo+ICsrKyBiL3Rlc3RjYXNlcy9r
ZXJuZWwvc2VjdXJpdHkvaW50ZWdyaXR5L2ltYS9SRUFETUUubWQKPiBAQCAtMTYsNiArMTYsMjgg
QEAgQ09ORklHX0lOVEVHUklUWT15Cj4gIENPTkZJR19JTUE9eQo+ICBgYGAKPiAgCj4gK0lNQSBL
ZXkgSW1wb3J0IHRlc3QKPiArLS0tLS0tLS0tLS0tLQo+ICtgaW1hX2tleXMuc2hgIHJlcXVpcmVz
IGFuIHg1MDkgY2VydGlmaWNhdGUgdG8gYmUgc2lnbmVkIGJ5IGEga2V5IG9uIG9uZQo+ICtvZiB0
aGUgdHJ1c3RlZCBrZXlyaW5ncy4gVGhlIHg1MDkgY2VydGlmaWNhdGUgbXVzdCBiZSBwbGFjZWQg
YXQKPiArYC9ldGMva2V5cy94NTA5X2ltYS5kZXJgIGZvciB0aGlzIHRlc3Qgb3IgdGhlIHBhdGgg
bXVzdCBiZSBwYXNzZWQgaW4KPiArdGhlIENFUlRfRklMRSBlbnYgdmFyLgo+ICsKPiArVGhlIHg1
MDkgcHVibGljIGtleSBrZXkgbXVzdCBiZSBzaWduZWQgYnkgdGhlIHByaXZhdGUga2V5IHlvdSBn
ZW5lcmF0ZS4KPiArRm9sbG93IHRoZXNlIGluc3RydWN0aW9uczoKPiAraHR0cHM6Ly9tYW5wYWdl
cy51YnVudHUuY29tL21hbnBhZ2VzL2Rpc2NvL21hbjEvZXZtY3RsLjEuaHRtbCNnZW5lcmF0ZSUy
MHRydXN0ZWQlMjBrZXlzLgo+ICsKPiArVGhlIHRlc3QgY2Fubm90IGJlIHNldC11cCBhdXRvbWF0
aWNhbGx5IGJlY2F1c2UgdGhlIHg1MDkgcHVibGljIGtleSBtdXN0IGJlCj4gK2J1aWx0IGludG8g
dGhlIGtlcm5lbCBhbmQgbG9hZGVkIG9udG8gYSB0cnVzdGVkIGtleXJpbmcuCj4gKwo+ICtBcyB3
ZWxsIGFzIHdoYXQncyByZXF1aXJlZCBmb3IgdGhlIElNQSB0ZXN0cywgdGhlIGZvbGxvd2luZyBh
cmUgYWxzbyByZXF1aXJlZAo+ICtpbiB0aGUga2VybmVsIGNvbmZpZ3VyYXRpb246Cj4gK2BgYAo+
ICtDT05GSUdfSU1BX1JFQURfUE9MSUNZPXkKPiArQ09ORklHX1NZU1RFTV9UUlVTVEVEX0tFWVJJ
Tkc9eQo+ICtDT05GSUdfU1lTVEVNX1RSVVNURURfS0VZUz0iL2V0Yy9rZXlzL2ltYS1sb2NhbC1j
YS5wZW0iCj4gK2BgYAo+ICsKPiAgRVZNIHRlc3RzCj4gIC0tLS0tLS0tLQo+ICAKPiBkaWZmIC0t
Z2l0IGEvdGVzdGNhc2VzL2tlcm5lbC9zZWN1cml0eS9pbnRlZ3JpdHkvaW1hL3Rlc3RzL2ltYV9r
ZXlzLnNoIGIvdGVzdGNhc2VzL2tlcm5lbC9zZWN1cml0eS9pbnRlZ3JpdHkvaW1hL3Rlc3RzL2lt
YV9rZXlzLnNoCj4gaW5kZXggOTRlYjE1ZTA5Li40OTk4ODEyNTEgMTAwNzU1Cj4gLS0tIGEvdGVz
dGNhc2VzL2tlcm5lbC9zZWN1cml0eS9pbnRlZ3JpdHkvaW1hL3Rlc3RzL2ltYV9rZXlzLnNoCj4g
KysrIGIvdGVzdGNhc2VzL2tlcm5lbC9zZWN1cml0eS9pbnRlZ3JpdHkvaW1hL3Rlc3RzL2ltYV9r
ZXlzLnNoCj4gQEAgLTUsMTAgKzUsMTIgQEAKPiAgIwo+ICAjIFZlcmlmeSB0aGF0IGtleXMgYXJl
IG1lYXN1cmVkIGNvcnJlY3RseSBiYXNlZCBvbiBwb2xpY3kuCj4gIAo+IC1UU1RfTkVFRFNfQ01E
Uz0iZ3JlcCBta3RlbXAgY3V0IHNlZCB0ciIKPiAtVFNUX0NOVD0xCj4gK1RTVF9ORUVEU19DTURT
PSJncmVwIG1rdGVtcCBjdXQgc2VkIHRyIHh4ZCBrZXljdGwgZXZtY3RsIG9wZW5zc2wgY21wIgo+
ICtUU1RfQ05UPTIKPiAgVFNUX05FRURTX0RFVklDRT0xCj4gIAo+ICtDRVJUX0ZJTEU9IiR7Q0VS
VF9GSUxFOi0vZXRjL2tleXMveDUwOV9pbWEuZGVyfSIKPiArCj4gIC4gaW1hX3NldHVwLnNoCj4g
IAo+ICAjIEJhc2VkIG9uIGh0dHBzOi8vbGttbC5vcmcvbGttbC8yMDE5LzEyLzEzLzU2NC4KPiBA
QCAtNjksNCArNzEsNDIgQEAgdGVzdDEoKQo+ICAJZmkKPiAgfQo+ICAKPiArCj4gKyMgVGVzdCB0
aGF0IGEgY2VydCBjYW4gYmUgaW1wb3J0ZWQgaW50byB0aGUgIi5pbWEiIGtleXJpbmcgY29ycmVj
dGx5Lgo+ICt0ZXN0MigpIHsKPiArCWxvY2FsIGtleXJpbmdfaWQga2V5X2lkIHRlc3RfZmlsZT0i
ZmlsZS50eHQiCj4gKwo+ICsJWyAtZiAkQ0VSVF9GSUxFIF0gfHwgdHN0X2JyayBUQ09ORiAibWlz
c2luZyAkQ0VSVF9GSUxFIgo+ICsKPiArCWlmICEgb3BlbnNzbCB4NTA5IC1pbiAkQ0VSVF9GSUxF
IC1pbmZvcm0gZGVyID4gL2Rldi9udWxsOyB0aGVuCj4gKwkJdHN0X2JyayBUQ09ORiAiVGhlIHN1
cHBsZWQgY2VydCBmaWxlICgkQ0VSVF9GSUxFKSBpcyBub3QgYSB2YWxpZCB4NTA5IGNlcnRpZmlj
YXRlIgo+ICsJZmkKPiArCj4gKwl0c3RfcmVzIFRJTkZPICJhZGRpbmcgYSBjZXJ0IHRvIHRoZSAu
aW1hIGtleXJpbmcgKCRDRVJUX0ZJTEUpIgoKQWJvdmUgdGhpcyBsaW5lIHRoZXJlIGlzIHNvbWUg
ZXh0cmFuZW91cyB3aGl0ZXNwYWNlLgoKPiArCQo+ICsJa2V5cmluZ19pZD0kKGtleWN0bCBkZXNj
cmliZSAlOi5pbWEgfCBjdXQgLWQnICcgLWYyIHwgdHIgLWQgJzonKSB8fCBcCj4gKwkJdHN0X2J0
ayBUQ09ORiAidW5hYmxlIHRvIHJldHJpZXZlIC5pbWEga2V5cmluZyBpZCIKCkl0IHNlZW1zICJr
ZXljdGwgZGVzY3JpYmUiIGlzIHJldHVybmluZyBkaWZmZXJlbnQgdGhpbmdzIGRlcGVuZGluZyBv
bgp0aGUgdmVyc2lvbi4gwqBZb3UgbXVzdCBiZSBzZWVpbmcgMiBzcGFjZXMgYmVmb3JlIHRoZSBr
ZXlyaW5nIGlkLiDCoE9uClVidW50dSAyMC4wLCBJJ20gc2VlaW5nIHRoZSBrZXlyaW5nIGlkIGlu
ZGVudGVkIHdpdGggMyBzcGFjZXMuwqDCoE9uIGFuCm9sZGVyIEZlZG9yYSwgdGhlcmUgYXJlIG5v
IHNwYWNlcy7CoMKgVHJ5IHJldmVyc2luZyB0aGUgY3V0IGFuZCB0cgpkZWxpbWl0ZXJzLgoKPiAr
Cj4gKwlpZiAhIHRzdF9pc19udW0JIiRrZXlyaW5nX2lkIjsgdGhlbgo+ICsJCXRzdF9icmsgVENP
TkYgInVuYWJsZSB0byBwYXJzZSBrZXlyaW5nIGlkIGZyb20ga2V5cmluZyIKPiArCWZpCj4gKwo+
ICsJZXZtY3RsIGltcG9ydCAkQ0VSVF9GSUxFICIka2V5cmluZ19pZCIgPiAvZGV2L251bGwgfHwg
XAo+ICsJCXRzdF9icmsgVENPTkYgInVuYWJsZSB0byBpbXBvcnQgYSBjZXJ0IGludG8gdGhlIC5p
bWEga2V5cmluZyIKPiArCj4gKwlncmVwIC1GICIuaW1hIiAiJEFTQ0lJX01FQVNVUkVNRU5UUyIg
fCB0YWlsIC1uMSB8IGN1dCAtZCcgJyAtZjYgfCBcCj4gKwkJeHhkIC1yIC1wID4gJHRlc3RfZmls
ZSB8fCBcCj4gKwkJdHN0X2JyayBUQ09ORiAiY2VydCBub3QgZm91bmQgaW4gYXNjaWlfcnVudGlt
ZV9tZWFzdXJlbWVudHMgbG9nIgoKVGhlIG9yaWdpbmFsIENFUlRfRklMRSBzaG91bGQgaGF2ZSBi
ZWVuIG1lYXN1cmVkIG9uIGJvb3QuIMKgSW4gZmFjdCwgaXQKc2hvdWxkIGhhdmUgYmVlbiB0aGUg
Zmlyc3Qga2V5IG9uIHRoZSAuaW1hIGtleXJpbmcgdG8gYmUgbWVhc3VyZWQuCsKgVW5sZXNzIHRo
ZSBDRVJUX0ZJTEUgY2hhbmdlZCwgaW1wb3J0aW5nIGl0IGFnYWluIHNob3VsZG4ndCBjYXVzZQph
bm90aGVyIHJlY29yZCB0byBiZSBhZGRlZCB0byB0aGUgbWVhc3VyZW1lbnQgbGlzdC4gwqBFeHBv
cnRpbmcgdGhlCmxhc3QgaW1wb3J0ZWQga2V5IG9udG8gdGhlIC5pbWEga2V5cmluZyB3b24ndCB3
b3JrLgoKPiArCj4gKwlpZiAhIG9wZW5zc2wgeDUwOSAtaW4gJHRlc3RfZmlsZSAtaW5mb3JtIGRl
ciA+IC9kZXYvbnVsbDsgdGhlbgo+ICsJCXRzdF9icmsgVENPTkYgIlRoZSBjZXJ0IGxvZ2dlZCBp
biBhc2NpaV9ydW50aW1lX21lYXN1cmVtZW50cyBpcyBub3QgYSB2YWxpZCB4NTA5IGNlcnRpZmlj
YXRlIgo+ICsJZmkKPiArCj4gKwlpZiBjbXAgLXMgIiR0ZXN0X2ZpbGUiICRDRVJUX0ZJTEU7IHRo
ZW4KPiArCQl0c3RfcmVzIFRQQVNTICJsb2dnZWQgY2VydCBtYXRjaGVzIG9yaWdpbmFsIGNlcnQi
Cj4gKwllbHNlCj4gKwkJdHN0X3JlcyBURkFJTCAibG9nZ2VkIGNlcnQgZG9lcyBub3QgbWF0Y2gg
b3JpZ2luYWwgY2VydCIKClRoaXMgaXMgZmFpbGluZyBkdWUgdG8gdGhlIGFib3ZlIHJlYXNvbi4K
Ck1pbWkKCj4gKwlmaQo+ICt9Cj4gKwo+ICB0c3RfcnVuCgoKLS0gCk1haWxpbmcgbGlzdCBpbmZv
OiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
