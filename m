Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 287D8207956
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Jun 2020 18:41:25 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A3C7B3C2BAF
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Jun 2020 18:41:24 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 03A603C01CE
 for <ltp@lists.linux.it>; Wed, 24 Jun 2020 18:41:20 +0200 (CEST)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 8BA8C1A00F2D
 for <ltp@lists.linux.it>; Wed, 24 Jun 2020 18:41:18 +0200 (CEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05OGXGIR034648; Wed, 24 Jun 2020 12:41:16 -0400
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31uwyyrfb9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Jun 2020 12:41:16 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05OGeTm2032324;
 Wed, 24 Jun 2020 16:41:13 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma01fra.de.ibm.com with ESMTP id 31uururg3b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Jun 2020 16:41:13 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05OGfB6d65077364
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 24 Jun 2020 16:41:11 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1D15EAE058;
 Wed, 24 Jun 2020 16:41:11 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5106AAE055;
 Wed, 24 Jun 2020 16:41:09 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.85.142.225])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 24 Jun 2020 16:41:09 +0000 (GMT)
Message-ID: <1593016868.27152.88.camel@linux.ibm.com>
From: Mimi Zohar <zohar@linux.ibm.com>
To: Lachlan Sneff <t-josne@linux.microsoft.com>, ltp@lists.linux.it,
 pvorel@suse.cz
Date: Wed, 24 Jun 2020 12:41:08 -0400
In-Reply-To: <20200617234957.10611-3-t-josne@linux.microsoft.com>
References: <20200617234957.10611-1-t-josne@linux.microsoft.com>
 <20200617234957.10611-3-t-josne@linux.microsoft.com>
X-Mailer: Evolution 3.20.5 (3.20.5-1.fc24) 
Mime-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-24_11:2020-06-24,
 2020-06-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 cotscore=-2147483648
 mlxscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 mlxlogscore=999
 phishscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006240113
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 2/2] IMA: Add a test to verify importing a
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
Cc: nramas@linux.microsoft.com, balajib@linux.microsoft.com,
 linux-integrity@vger.kernel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkgTGFjaGxhbiwKCk9uIFdlZCwgMjAyMC0wNi0xNyBhdCAxOTo0OSAtMDQwMCwgTGFjaGxhbiBT
bmVmZiB3cm90ZToKPiBBZGQgYW4gSU1BIG1lYXN1cmVtZW50IHRlc3QgdGhhdCB2ZXJpZmllcyB0
aGF0IGFuIHg1MDkgY2VydGlmaWNhdGUKPiBjYW4gYmUgaW1wb3J0ZWQgaW50byB0aGUgLmltYSBr
ZXlyaW5nIGFuZCBtZWFzdXJlZCBjb3JyZWN0bHkuCgpQbGVhc2UgZXhwYW5kIHRoaXMsIGV4cGxh
aW5pbmcgdGhhdCB0aGUgeDUwOSBjZXJ0aWZpY2F0ZSBuZWVkcyB0byBiZQpzaWduZWQgYnkgYSBr
ZXkgb24gb25lIG9mIHRoZSB0cnVzdGVkIGtleXJpbmdzLgoKT25jZSB0aGVyZSBpcyBhIHJlbGlh
YmxlIHdheSBvZiBhZGRpbmcgYSBrZXkgdG8gdGhlIElNQSBrZXlyaW5nLCB0aGlzCm9wZW5zIHVw
IGEgbG90IG9mIG90aGVyIHRlc3RpbmcgcG9zc2liaWxpdGllcy4KCj4gCj4gU2lnbmVkLW9mZi1i
eTogTGFjaGxhbiBTbmVmZiA8dC1qb3NuZUBsaW51eC5taWNyb3NvZnQuY29tPgo+IC0tLQo+ICAu
Li4va2VybmVsL3NlY3VyaXR5L2ludGVncml0eS9pbWEvUkVBRE1FLm1kICAgfCAyMSArKysrKysr
KysKPiAgLi4uL3NlY3VyaXR5L2ludGVncml0eS9pbWEvdGVzdHMvaW1hX2tleXMuc2ggIHwgNDcg
KysrKysrKysrKysrKysrKysrLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDY2IGluc2VydGlvbnMoKyks
IDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3Rlc3RjYXNlcy9rZXJuZWwvc2VjdXJp
dHkvaW50ZWdyaXR5L2ltYS9SRUFETUUubWQgYi90ZXN0Y2FzZXMva2VybmVsL3NlY3VyaXR5L2lu
dGVncml0eS9pbWEvUkVBRE1FLm1kCj4gaW5kZXggMTZhMWY0OGMzLi5lNDFmN2I1NzAgMTAwNjQ0
Cj4gLS0tIGEvdGVzdGNhc2VzL2tlcm5lbC9zZWN1cml0eS9pbnRlZ3JpdHkvaW1hL1JFQURNRS5t
ZAo+ICsrKyBiL3Rlc3RjYXNlcy9rZXJuZWwvc2VjdXJpdHkvaW50ZWdyaXR5L2ltYS9SRUFETUUu
bWQKPiBAQCAtMTYsNiArMTYsMjcgQEAgQ09ORklHX0lOVEVHUklUWT15Cj4gIENPTkZJR19JTUE9
eQo+ICBgYGAKPiAgCj4gK0lNQSBLZXkgSW1wb3J0IHRlc3QKPiArLS0tLS0tLS0tLS0tLQo+ICsK
PiArYGltYV9rZXlzLnNoYCByZXF1aXJlcyBhbiB4NTA5IGtleSB0byBiZSBnZW5lcmF0ZWQgYW5k
IHBsYWNlZAo+ICthdCBgL2V0Yy9rZXlzL3g1MDlfaW1hLmRlcmAuCgpUaGUgZmlsZW5hbWUgIi9l
dGMva2V5cy94NTA5X2ltYS5kZXIiIGlzIGNvbmZpZ3VyYWJsZS4gwqBJdCdzIGJhc2VkIG9uCkNP
TkZJR19JTUFfWDUwOV9QQVRIIEtjb25maWcgb3B0aW9uLiDCoFBlcmhhcHMgZXh0cmFjdCBpdCBm
cm9tIHRoZQpydW5uaW5nIGtlcm5lbCdzIEtjb25maWc/Cgo+ICsKPiArVGhlIHg1MDkgcHVibGlj
IGtleSBrZXkgbXVzdCBiZSBzaWduZWQgYnkgdGhlIHByaXZhdGUga2V5IHlvdSBnZW5lcmF0ZS4K
PiArRm9sbG93IHRoZXNlIGluc3RydWN0aW9uczoKPiAraHR0cHM6Ly9tYW5wYWdlcy51YnVudHUu
Y29tL21hbnBhZ2VzL2Rpc2NvL21hbjEvZXZtY3RsLjEuaHRtbCNnZW5lcmF0ZSUyMHRydXN0ZWQl
MjBrZXlzLgo+ICsKPiArVGhlIHRlc3QgY2Fubm90IGJlIHNldC11cCBhdXRvbWF0aWNhbGx5IGJl
Y2F1c2UgdGhlIGtlcm5lbCBtdXN0IGJlIGJ1aWx0Cj4gK3dpdGggb25lIG9mIHRoZSBrZXlzIHlv
dSBnZW5lcmF0ZS4KClBsZWFzZSByZXdvcmQgdGhpcyB0byBjb252ZXkgdGhhdCB0aGUgcHVibGlj
IGtleSBtdXN0IGJlIGJ1aWx0IGludG8KdGhlIGtlcm5lbCBhbmQgbG9hZGVkIG9udG8gYSB0cnVz
dGVkIGtleXJpbmcgKGVnLgouYnVpbHRpbl90cnVzdGVkX2tleXMsIC5zZWNvbmRhcnlfdHJ1c3Rl
ZF9rZXlyaW5nKQoKPiArCj4gK0FzIHdlbGwgYXMgd2hhdCdzIHJlcXVpcmVkIGZvciB0aGUgSU1B
IHRlc3RzLCB0aGUgZm9sbG93aW5nIGFyZSBhbHNvIHJlcXVpcmVkCj4gK2luIHRoZSBrZXJuZWwg
Y29uZmlndXJhdGlvbjoKPiArYGBgCj4gK0NPTkZJR19JTUFfUkVBRF9QT0xJQ1k9eQo+ICtDT05G
SUdfU1lTVEVNX1RSVVNURURfS0VZUklORz15Cj4gK0NPTkZJR19TWVNURU1fVFJVU1RFRF9LRVlT
PSIvZXRjL2tleXMvaW1hLWxvY2FsLWNhLnBlbSIKPiArYGBgCj4gKwo+ICBFVk0gdGVzdHMKPiAg
LS0tLS0tLS0tCj4gIAo+IGRpZmYgLS1naXQgYS90ZXN0Y2FzZXMva2VybmVsL3NlY3VyaXR5L2lu
dGVncml0eS9pbWEvdGVzdHMvaW1hX2tleXMuc2ggYi90ZXN0Y2FzZXMva2VybmVsL3NlY3VyaXR5
L2ludGVncml0eS9pbWEvdGVzdHMvaW1hX2tleXMuc2gKPiBpbmRleCAyYjUzMjRkYmYuLjFkOTgy
NGFiYSAxMDA3NTUKPiAtLS0gYS90ZXN0Y2FzZXMva2VybmVsL3NlY3VyaXR5L2ludGVncml0eS9p
bWEvdGVzdHMvaW1hX2tleXMuc2gKPiArKysgYi90ZXN0Y2FzZXMva2VybmVsL3NlY3VyaXR5L2lu
dGVncml0eS9pbWEvdGVzdHMvaW1hX2tleXMuc2gKPiBAQCAtNSwxMCArNSwxMiBAQAo+ICAjCj4g
ICMgVmVyaWZ5IHRoYXQga2V5cyBhcmUgbWVhc3VyZWQgY29ycmVjdGx5IGJhc2VkIG9uIHBvbGlj
eS4KPiAgCj4gLVRTVF9ORUVEU19DTURTPSJncmVwIG1rdGVtcCBjdXQgc2VkIHRyIgo+IC1UU1Rf
Q05UPTEKPiArVFNUX05FRURTX0NNRFM9ImdyZXAgbWt0ZW1wIGN1dCBzZWQgdHIgeHhkIGtleWN0
bCBldm1jdGwgb3BlbnNzbCBjbXAiCj4gK1RTVF9DTlQ9Mgo+ICBUU1RfTkVFRFNfREVWSUNFPTEK
PiAgCj4gK0NFUlRfRklMRT0iJHtDRVJUX0ZJTEU6LS9ldGMva2V5cy94NTA5X2ltYS5kZXJ9Igo+
ICsKPiAgLiBpbWFfc2V0dXAuc2gKPiAgCj4gICMgQmFzZWQgb24gaHR0cHM6Ly9sa21sLm9yZy9s
a21sLzIwMTkvMTIvMTMvNTY0Lgo+IEBAIC02NCw0ICs2Niw0NSBAQCB0ZXN0MSgpCj4gIAl0c3Rf
cmVzIFRQQVNTICJzcGVjaWZpZWQga2V5cmluZ3Mgd2VyZSBtZWFzdXJlZCBjb3JyZWN0bHkiCj4g
IH0KPiAgCj4gKwo+ICsjIFRlc3QgdGhhdCBhIGNlcnQgY2FuIGJlIGltcG9ydGVkIGludG8gdGhl
ICIuaW1hIiBrZXlyaW5nIGNvcnJlY3RseS4KPiArdGVzdDIoKSB7Cj4gKwlsb2NhbCBrZXlyaW5n
X2lkIGtleV9pZCB0ZXN0X2ZpbGU9JChta3RlbXApCj4gKwo+ICsJWyAtZiAkQ0VSVF9GSUxFIF0g
fHwgdHN0X2JyayBUQ09ORiAibWlzc2luZyAkQ0VSVF9GSUxFIgo+ICsKPiArCWlmICEgb3BlbnNz
bCB4NTA5IC1pbiAkQ0VSVF9GSUxFIC1pbmZvcm0gZGVyID4gL2Rldi9udWxsOyB0aGVuCj4gKwkJ
dHN0X2JyayBUQ09ORiAiVGhlIHN1cHBsZWQgY2VydCBmaWxlICgkQ0VSVF9GSUxFKSBpcyBub3Qg
YSB2YWxpZCB4NTA5IGNlcnRpZmljYXRlIgo+ICsJZmkKPiArCj4gKwl0c3RfcmVzIFRJTkZPICJh
ZGRpbmcgYSBjZXJ0IHRvIHRoZSAuaW1hIGtleXJpbmcgKCRDRVJUX0ZJTEUpIgo+ICsKPiArCWtl
eXJpbmdfaWQ9JChrZXljdGwgc2hvdyAlOi5pbWEgfCBzZWQgLW4gMnAgfCBcCj4gKwkJc2VkICdz
L15bWzpzcGFjZTpdXSovLycgfCBjdXQgLWQnICcgLWYxKSB8fCBcCj4gKwkJdHN0X2J0ayBUQ09O
RiAidW5hYmxlIHRvIHJldHJpZXZlIC5pbWEga2V5cmluZyBpZCIKClVzaW5nICJrZXljdGwgZGVz
Y3JpYmUiIHJldHVybnMgdGhlIGtleXJpbmcgaWQgYXMgdGhlIGZpcnN0IHRva2VuLAptYWtpbmcg
aXQgc2ltcGxlciB0byBwYXJzZS4KCk1pbWkKCj4gKwo+ICsJaWYgISB0c3RfaXNfbnVtCSIka2V5
cmluZ19pZCI7IHRoZW4KPiArCQl0c3RfYnJrIFRDT05GICJ1bmFibGUgdG8gcGFyc2Uga2V5cmlu
ZyBpZCBmcm9tIGtleXJpbmciCj4gKwlmaQo+ICsKPiArCWV2bWN0bCBpbXBvcnQgJENFUlRfRklM
RSAiJGtleXJpbmdfaWQiID4gL2Rldi9udWxsIHx8IFwKPiArCQl0c3RfYnJrIFRDT05GICJ1bmFi
bGUgdG8gaW1wb3J0IGEgY2VydCBpbnRvIHRoZSAuaW1hIGtleXJpbmciCj4gKwo+ICsJZ3JlcCAt
RiAiLmltYSIgIiRBU0NJSV9NRUFTVVJFTUVOVFMiIHwgdGFpbCAtbjEgfCBjdXQgLWQnICcgLWY2
IHwgXAo+ICsJCXh4ZCAtciAtcCA+ICR0ZXN0X2ZpbGUgfHwgXAo+ICsJCXRzdF9icmsgVENPTkYg
ImNlcnQgbm90IGZvdW5kIGluIGFzY2lpX3J1bnRpbWVfbWVhc3VyZW1lbnRzIGxvZyIKPiArCj4g
KwlpZiAhIG9wZW5zc2wgeDUwOSAtaW4gJHRlc3RfZmlsZSAtaW5mb3JtIGRlciA+IC9kZXYvbnVs
bDsgdGhlbgo+ICsJCXRzdF9icmsgVENPTkYgIlRoZSBjZXJ0IGxvZ2dlZCBpbiBhc2NpaV9ydW50
aW1lX21lYXN1cmVtZW50cyBpcyBub3QgYSB2YWxpZCB4NTA5IGNlcnRpZmljYXRlIgo+ICsJZmkK
PiArCj4gKwlpZiBjbXAgLXMgIiR0ZXN0X2ZpbGUiICRDRVJUX0ZJTEU7IHRoZW4KPiArCQl0c3Rf
cmVzIFRQQVNTICJsb2dnZWQgY2VydCBtYXRjaGVzIG9yaWdpbmFsIGNlcnQiCj4gKwllbHNlCj4g
KwkJdHN0X3JlcyBURkFJTCAibG9nZ2VkIGNlcnQgZG9lcyBub3QgbWF0Y2ggb3JpZ2luYWwgY2Vy
dCIKPiArCWZpCj4gKwo+ICsJcm0gJHRlc3RfZmlsZQo+ICt9Cj4gKwo+ICB0c3RfcnVuCgoKLS0g
Ck1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
