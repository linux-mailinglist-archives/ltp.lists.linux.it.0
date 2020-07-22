Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ECA72299B5
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Jul 2020 16:04:58 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D202B3C4DB6
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Jul 2020 16:04:57 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 3B2B13C223E
 for <ltp@lists.linux.it>; Wed, 22 Jul 2020 16:04:53 +0200 (CEST)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 71F3F601635
 for <ltp@lists.linux.it>; Wed, 22 Jul 2020 16:04:51 +0200 (CEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06ME1pFM010319; Wed, 22 Jul 2020 10:04:49 -0400
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32e1x84rxc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Jul 2020 10:04:48 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06ME4bkN013511;
 Wed, 22 Jul 2020 14:04:46 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04fra.de.ibm.com with ESMTP id 32dbmn1asx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Jul 2020 14:04:45 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06ME4hYu32702854
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Jul 2020 14:04:43 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9F966A4054;
 Wed, 22 Jul 2020 14:04:43 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D24D3A405C;
 Wed, 22 Jul 2020 14:04:42 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.85.139.199])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 22 Jul 2020 14:04:42 +0000 (GMT)
Message-ID: <1595426682.5311.83.camel@linux.ibm.com>
From: Mimi Zohar <zohar@linux.ibm.com>
To: Lachlan Sneff <t-josne@linux.microsoft.com>, pvorel@suse.cz,
 ltp@lists.linux.it
Date: Wed, 22 Jul 2020 10:04:42 -0400
In-Reply-To: <20200721182440.4169-1-t-josne@linux.microsoft.com>
References: <20200721182440.4169-1-t-josne@linux.microsoft.com>
X-Mailer: Evolution 3.20.5 (3.20.5-1.fc24) 
Mime-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-22_05:2020-07-22,
 2020-07-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0
 spamscore=0 adultscore=0 mlxscore=0 bulkscore=0 lowpriorityscore=0
 suspectscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2007220099
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] IMA: Add test for kexec cmdline measurement
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
Cc: nramas@linux.microsoft.com, linux-integrity@vger.kernel.org,
 balajib@linux.microsoft.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

T24gVHVlLCAyMDIwLTA3LTIxIGF0IDE0OjI0IC0wNDAwLCBMYWNobGFuIFNuZWZmIHdyb3RlOgoK
PHNuaXA+Cgo+IGRpZmYgLS1naXQgYS90ZXN0Y2FzZXMva2VybmVsL3NlY3VyaXR5L2ludGVncml0
eS9pbWEvdGVzdHMvaW1hX2tleGVjLnNoIGIvdGVzdGNhc2VzL2tlcm5lbC9zZWN1cml0eS9pbnRl
Z3JpdHkvaW1hL3Rlc3RzL2ltYV9rZXhlYy5zaAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5k
ZXggMDAwMDAwMDAwLi43ZDcxNTU3ZWUKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvdGVzdGNhc2Vz
L2tlcm5lbC9zZWN1cml0eS9pbnRlZ3JpdHkvaW1hL3Rlc3RzL2ltYV9rZXhlYy5zaAo+IEBAIC0w
LDAgKzEsOTMgQEAKPiArIyEvYmluL3NoCj4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQ
TC0yLjAtb3ItbGF0ZXIKPiArIyBDb3B5cmlnaHQgKGMpIDIwMjAgTWljcm9zb2Z0IENvcnBvcmF0
aW9uCj4gKyMgQXV0aG9yOiBMYWNobGFuIFNuZWZmIDx0LWpvc25lQGxpbnV4Lm1pY3Jvc29mdC5j
b20+Cj4gKyMKPiArIyBWZXJpZnkgdGhhdCBrZXhlYyBjbWRsaW5lIGlzIG1lYXN1cmVkIGNvcnJl
Y3RseS4KPiArCj4gK1RTVF9ORUVEU19DTURTPSJrZXhlYyBzZWQgeGFyZ3MgcHJpbnRmIGdyZXAi
Cj4gK1RTVF9DTlQ9MQo+ICtUU1RfTkVFRFNfREVWSUNFPTEKPiArCj4gKy4gaW1hX3NldHVwLnNo
Cj4gKwo+ICsjIFNpbmNlIHRoZSB0ZXN0IGlzIGV4ZWN1dGVkIGluc2lkZSBzb21lIHNvcnQgb2YK
PiArIyBzZXBhcmF0ZSBzaGVsbCwgKm1vc3QqIGVudmlyb25tZW50IHZhcmlhYmxlcyBhcmUKPiAr
IyBub3QgYWNjZXNzaWJsZSwgc28gdGhlcmUncyBubyB3YXkgdG8gc2V0IGl0IGZyb20KPiArIyB0
aGUgb3V0c2lkZS4KPiArIwo+ICsjIGAvYm9vdC92bWxpbnV6LSQodW5hbWUtcilgIGlzIHdoZXJl
IHRoZSBpbWFnZSBpcwo+ICsjIGxvY2F0ZWQgb24gbWFueSBzeXN0ZW1zLCBidXQgbm90IGFsbC4g
VGhlcmVmb3JlLAo+ICsjIGlmIHRoZSBpbWFnZSBpcyBub3QgbG9jYXRlZCB0aGVyZSwgcmVxdWly
ZSB0aGUKPiArIyB1c2VyIHRvIGNvcHkgaXQgdG8gYC90bXAvSW1hZ2VgLgo+ICsjCj4gKyMgSWRl
YWxseSwgdGhpcyB0ZXN0IHNob3VsZG4ndCBldmVuIHJlcXVpcmUgYW4gaW1hZ2UsCj4gKyMgc2lu
Y2UgaXQgZG9lc24ndCBhY3R1YWxseSByZWJvb3QsIGJ1dCB0aGUgSU1BIGNtZGxpbmUKPiArIyBt
ZWFzdXJlbWVudCBvY2N1cnMgYWZ0ZXIgdGhlIGltYWdlIGlzIHBhcnNlZCBhbmQgdmVyaWZpZWQs
Cj4gKyMgc28gd2UgbXVzdCBwYXNzIGEgdmFsaWQga2VybmVsIGltYWdlLiBUaGVyZSBpcyBhIHBv
c3NpYmxpdHkgb2YKPiArIyBwdXR0aW5nIHRvZ2V0aGVyIGEgImZhdXgiIGtlcm5lbCBpbWFnZSB0
aGF0IGhhcyB0aGUgcmlnaHQgaGVhZGVycwo+ICsjIGFuZCBhcHBlYXJzIHRvIGJlIHNpZ25lZCBj
b3JyZWN0bHksIGJ1dCBkb2Vzbid0IGFjdHVhbGx5IGNvbnRhaW4gYW55Cj4gKyMgY29kZSwgYnV0
LCBhZnRlciBpbnZlc3RpZ2F0aW5nIHRoYXQgcG9zc2libGl0eSwgaXQgYXBwZWFycyB0byBiZQo+
ICsjIHF1aXRlIGRpZmZpY3VsdCAoYW5kIHdvdWxkIHJlcXVpcmUgYSBuZXcgZmF1eCBrZXJuZWwg
Zm9yIGVhY2ggYXJjaCkuCgpUaGUgY29tbWVudCBmb3JtYXR0aW5nIGlzIGluY29uc2lzdGVudC4g
wqBQbGVhc2UgY29ycmVjdC4KCj4gK0lNQUdFPSIvYm9vdC92bWxpbnV6LSQodW5hbWUgLXIpIgo+
ICtpZiBbICEgLWYgJElNQUdFIF07IHRoZW4KPiArICAgIElNQUdFPSIvdG1wL0ltYWdlIgo+ICtm
aQo+ICsKPiArbWVhc3VyZSgpIHsKPiArICAgIGxvY2FsIGZvdW5kIHRlbXBfZmlsZT0iZmlsZS50
eHQiIHRlbXBfZmlsZTI9ImZpbGUyLnR4dCIgYWxnb3JpdGhtIFwKPiArICAgICAgICBkaWdlc3Qg
ZXhwZWN0ZWRfZGlnZXN0Cj4gKwo+ICsgICAgZWNobyAtbiAiJDEiID4gJHRlbXBfZmlsZQo+ICsg
ICAgZ3JlcCAia2V4ZWMtY21kbGluZSIgJEFTQ0lJX01FQVNVUkVNRU5UUyA+ICR0ZW1wX2ZpbGUy
Cj4gKwo+ICsgICAgd2hpbGUgcmVhZCBmb3VuZAo+ICsgICAgZG8KPiArICAgICAgICBhbGdvcml0
aG09JChlY2hvICIkZm91bmQiIHwgY3V0IC1kJyAnIC1mNCB8IGN1dCAtZCc6JyAtZjEpCj4gKyAg
ICAgICAgZGlnZXN0PSQoZWNobyAiJGZvdW5kIiB8IGN1dCAtZCcgJyAtZjQgfCBjdXQgLWQnOicg
LWYyKQo+ICsKPiArICAgICAgICBleHBlY3RlZF9kaWdlc3Q9JChjb21wdXRlX2RpZ2VzdCAkYWxn
b3JpdGhtICR0ZW1wX2ZpbGUpCj4gKwo+ICsgICAgICAgIGlmIFsgIiRkaWdlc3QiID0gIiRleHBl
Y3RlZF9kaWdlc3QiIF07IHRoZW4KPiArICAgICAgICAgICAgcmV0dXJuIDAKPiArICAgICAgICBm
aQo+ICsgICAgZG9uZSA8ICR0ZW1wX2ZpbGUyCj4gKwo+ICsgICAgcmV0dXJuIDEKPiArfQo+ICsK
PiArIyBUZXN0IHRoYXQgdGhlIGtleGVjIGNtZGxpbmUgaXMgbWVhc3VyZWQgY29ycmVjdGx5Lgo+
ICsjIE5PVEU6IFRoaXMgZG9lcyAqbm90KiBhY3R1YWxseSByZWJvb3QuCj4gK3Rlc3QxKCkgewo+
ICsgICAgIyBTdHJpcCB0aGUgYEJPT1RfSU1BR0U9Li4uYCBwYXJ0IGZyb20gdGhlIGNtZGxpbmUu
Cj4gKyAgICBsb2NhbCBjbWRsaW5lPSIkKHNlZCAncy9CT09UX0lNQUdFPVteIF0qIC8vJyAvcHJv
Yy9jbWRsaW5lKSIKPiArICAgIGlmICEga2V4ZWMgLXNsICRJTUFHRSAtLXJldXNlLWNtZGxpbmU7
IHRoZW4KPiArICAgICAgICB0c3RfYnJrIFRDT05GICJrZXhlYyBmYWlsZWQ6ICQ/Igo+ICsgICAg
ZmkKCk1vc3QgbGlrZWx5IG9uZSBvZiB0aGUgcmVhc29ucyBmb3IgdGhlIGtleGVjIHRvIGZhaWwg
aXMgdGhhdCB0aGUKa2VybmVsIGltYWdlIGlzbid0IHByb3Blcmx5IHNpZ25lZC4gwqBIb3cgYWJv
dXQgY2hlY2tpbmcgdGhlIHNlY3VyZS0KYm9vdCBzdGF0dXMgdG8gcHJvdmlkZSBzb21lIGNvbnRl
eHR1YWwgaW5mb3JtYXRpb24uCgo+ICsKPiArICAgIGlmICEgbWVhc3VyZSAiJGNtZGxpbmUiOyB0
aGVuCj4gKyAgICAgICAgdHN0X2JyayBURkFJTCAia2V4ZWMgY21kbGluZSB3YXMgbWVhc3VyZWQg
aW5jb3JyZWN0bHkiCj4gKyAgICBmaQoKVGhpcyBhc3N1bWVzIHRoYXQgYSBrZXhlYyBjb21tYW5k
IGxpbmUgbWVhc3VyZW1lbnQgd2FzIGZvdW5kLiDCoFRoZQpvdXRwdXQgbmVlZHMgdG8gZGlmZmVy
ZW50aWF0ZSBiZXR3ZWVuIG5vIG1lYXN1cmVtZW50IGFuZCBhbiBpbnZhbGlkCm1lYXN1cmVtZW50
LiDCoEluIHRoZSBjYXNlIHRoYXQgdGhlIHJ1bGUgZG9lc24ndCBleGlzdCwgYXQgdGhhdCBwb2lu
dAp5b3UgaGF2ZSBhIGNob2ljZSBvZiBza2lwcGluZyB0aGUgdGVzdCBvciBleHRlbmRpbmcgdGhl
IElNQSBwb2xpY3kuwqAKClRoZSBrZXJuZWwga2V4ZWMgc2VsZnRlc3RzIGNoZWNrcyBib3RoIHRo
ZSBLY29uZmlnIGFuZCB0aGUgSU1BIHJ1bnRpbWUKcG9saWN5LiDCoERpZmZlcmVudCB0ZXN0aW5n
IGluZnJhc3RydWN0dXJlcyBoYXZlIGRpZmZlcmVudCBwb2xpY2llcwphYm91dCBiYXNpbmcgdGVz
dHMgb24gdGhlbS4KCj4gKwo+ICsgICAgY21kbGluZT0iZm9vIgoKV29uZGVyaW5nIGlmIHVua25v
d24gY29tbWFuZCBsaW5lIG9wdGlvbnMgY291bGQgY2F1c2UgdGhlIGtleGVjIHRvCmZhaWwuCgo+
ICsgICAgaWYgISBrZXhlYyAtc2wgJElNQUdFIC0tYXBwZW5kPSRjbWRsaW5lOyB0aGVuCj4gKyAg
ICAgICAgdHN0X2JyayBUQ09ORiAia2V4ZWMgZmFpbGVkOiAkPyIKPiArICAgIGZpCgpTaG91bGQg
dGhlIGZpcnN0IGtlcm5lbCBpbWFnZSBiZSB1bmxvYWRlZCBmaXJzdD8KCk1pbWkKCj4gKwo+ICsg
ICAgaWYgISBtZWFzdXJlICIkY21kbGluZSI7IHRoZW4KPiArICAgICAgICB0c3RfYnJrIFRGQUlM
ICJrZXhlYyBjbWRsaW5lIHdhcyBtZWFzdXJlZCBpbmNvcnJlY3RseSIKPiArICAgIGZpCj4gKwo+
ICsgICAgY21kbGluZT0iYmFyIgo+ICsgICAgaWYgISBrZXhlYyAtc2wgJElNQUdFIC0tY29tbWFu
ZC1saW5lPSRjbWRsaW5lOyB0aGVuCj4gKyAgICAgICAgdHN0X2JyayBUQ09ORiAia2V4ZWMgZmFp
bGVkOiAkPyIKPiArICAgIGZpCj4gKwo+ICsgICAgaWYgISBtZWFzdXJlICIkY21kbGluZSI7IHRo
ZW4KPiArICAgICAgICB0c3RfYnJrIFRGQUlMICJrZXhlYyBjbWRsaW5lIHdhcyBtZWFzdXJlZCBp
bmNvcnJlY3RseSIKPiArICAgIGZpCj4gKwo+ICsgICAgdHN0X3JlcyBUUEFTUyAia2V4ZWMgY21s
ZGluZSB3YXMgbWVhc3VyZWQgY29ycmVjdGx5Igo+ICt9Cj4gKwo+ICt0c3RfcnVuCgoKLS0gCk1h
aWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
