Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E036322C4A3
	for <lists+linux-ltp@lfdr.de>; Fri, 24 Jul 2020 14:02:23 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A20713C4CFF
	for <lists+linux-ltp@lfdr.de>; Fri, 24 Jul 2020 14:02:23 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 0E6A03C061B
 for <ltp@lists.linux.it>; Fri, 24 Jul 2020 14:02:20 +0200 (CEST)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 72E811001F36
 for <ltp@lists.linux.it>; Fri, 24 Jul 2020 14:02:18 +0200 (CEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06OC2D4j074841; Fri, 24 Jul 2020 08:02:16 -0400
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32faep9vr3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Jul 2020 08:02:15 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06OC1Pe3010384;
 Fri, 24 Jul 2020 12:01:55 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma06fra.de.ibm.com with ESMTP id 32brbgux1p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Jul 2020 12:01:55 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 06OC1qTJ63963402
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 24 Jul 2020 12:01:53 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DD09511C050;
 Fri, 24 Jul 2020 12:01:52 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E78F911C04C;
 Fri, 24 Jul 2020 12:01:51 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.85.202.187])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 24 Jul 2020 12:01:51 +0000 (GMT)
Message-ID: <1595592111.5211.246.camel@linux.ibm.com>
From: Mimi Zohar <zohar@linux.ibm.com>
To: Petr Vorel <pvorel@suse.cz>, ltp@lists.linux.it
Date: Fri, 24 Jul 2020 08:01:51 -0400
In-Reply-To: <20200724070038.29491-2-pvorel@suse.cz>
References: <20200724070038.29491-1-pvorel@suse.cz>
 <20200724070038.29491-2-pvorel@suse.cz>
X-Mailer: Evolution 3.20.5 (3.20.5-1.fc24) 
Mime-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-24_03:2020-07-24,
 2020-07-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0
 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0 mlxscore=0
 phishscore=0 adultscore=0 mlxlogscore=999 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007240089
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 2/2] IMA: Add test for kexec cmdline measurement
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
Cc: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
 Mimi Zohar <zohar@linux.vnet.ibm.com>, linux-integrity@vger.kernel.org,
 balajib@linux.microsoft.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

T24gRnJpLCAyMDIwLTA3LTI0IGF0IDA5OjAwICswMjAwLCBQZXRyIFZvcmVsIHdyb3RlOgo+IEZy
b206IExhY2hsYW4gU25lZmYgPHQtam9zbmVAbGludXgubWljcm9zb2Z0LmNvbT4KPiAKPiBJTUEg
cG9saWN5IGNhbiBiZSBzZXQgdG8gbWVhc3VyZSB0aGUgY29tbWFuZCBsaW5lIHBhc3NlZCBpbiB0
aGUga2V4ZWMKPiBzeXN0ZW0gY2FsbC4gQWRkIGEgdGVzdGNhc2UgdGhhdCB2ZXJpZmllcyB0aGF0
IHRoZSBJTUEgc3Vic3lzdGVtCj4gY29ycmVjdGx5IG1lYXN1cmUgdGhlIGNtZGxpbmUgc3BlY2lm
aWVkIGR1cmluZyBhIGtleGVjLgo+IAo+IE5vdGUgdGhhdCB0aGlzIHRlc3QgZG9lcyBub3QgYWN0
dWFsbHkgcmVib290Lgo+IAo+IElkZWFsbHksIHRlc3Qgc2hvdWxkbid0IGV2ZW4gcmVxdWlyZSBh
biBpbWFnZSwgc2luY2UgaXQgZG9lc24ndCBhY3R1YWxseQo+IHJlYm9vdCwgYnV0IHRoZSBJTUEg
Y21kbGluZSBtZWFzdXJlbWVudCBvY2N1cnMgYWZ0ZXIgdGhlIGltYWdlIGlzIHBhcnNlZAo+IGFu
ZCB2ZXJpZmllZCwgc28gd2UgbXVzdCBwYXNzIGEgdmFsaWQga2VybmVsIGltYWdlLgo+IAo+IFRo
ZXJlIGlzIGEgcG9zc2liaWxpdHkgb2YgcHV0dGluZyB0b2dldGhlciBhIGR1bW15IGtlcm5lbCBp
bWFnZSB0aGF0IGhhcwo+IHRoZSByaWdodCBoZWFkZXJzIGFuZCBhcHBlYXJzIHRvIGJlIHNpZ25l
ZCBjb3JyZWN0bHksIGJ1dCBkb2Vzbid0Cj4gYWN0dWFsbHkgY29udGFpbiBhbnkgY29kZSwgYnV0
LCBhZnRlciBpbnZlc3RpZ2F0aW5nIHRoYXQgcG9zc2liaWxpdHksIGl0Cj4gYXBwZWFycyB0byBi
ZSBxdWl0ZSBkaWZmaWN1bHQgKGFuZCB3b3VsZCByZXF1aXJlIGEgZHVtbXkga2VybmVsIGZvciBl
YWNoCj4gYXJjaCkuCgpUaGlzIHRlc3QgYXR0ZW1wdHMgdG8ga2V4ZWMgdGhlIGV4aXN0aW5nIHJ1
bm5pbmcga2VybmVsIGltYWdlLiDCoFRvCmtleGVjIGEgZGlmZmVyZW50IGtlcm5lbCBpbWFnZSBl
eHBvcnQgSU1BX0tFWEVDX0lNQUdFPTxwYXRobmFtZT4uCj4gCj4gUmV2aWV3ZWQtYnk6IFBldHIg
Vm9yZWwgPHB2b3JlbEBzdXNlLmN6Pgo+IFNpZ25lZC1vZmYtYnk6IExhY2hsYW4gU25lZmYgPHQt
am9zbmVAbGludXgubWljcm9zb2Z0LmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBQZXRyIFZvcmVsIDxw
dm9yZWxAc3VzZS5jej4KPiAtLS0KPiBIaSwKPiBzZW50IHZlcnNpb24gd2l0aCBmZXcgbXkgZml4
ZXMuCj4gQE1pbWk6IGNvdWxkIHlvdSBwbGVhc2UgaGF2ZSBhIHF1aWNrIGxvb2s/IChJIGtub3cg
eW91IHJldmlld2VkIHByZXZpb3VzCj4gdmVyc2lvbi4pCgpUaGFua3MsIFBldHIuICBKdXN0IGEg
Y291cGxlIG9mIGNvbW1lbnRzIC4uLgoKIAo8c25pcD4KCj4gKyMgVGVzdCB0aGF0IHRoZSBrZXhl
YyBjbWRsaW5lIGlzIG1lYXN1cmVkIGNvcnJlY3RseS4KPiArIyBOT1RFOiBUaGlzIGRvZXMgKm5v
dCogYWN0dWFsbHkgcmVib290Lgo+ICt0ZXN0MSgpIHsKPiArCWlmIFsgISAtZiAiJElNQV9LRVhF
Q19JTUFHRSIgXTsgdGhlbgo+ICsJCXRzdF9icmsgVENPTkYgIktlcm5lbCBpbWFnZSBub3QgZm91
bmQgKCckSU1BX0tFWEVDX0lNQUdFJyksIHNwZWNpZnkgaXQgaW4gXCRJTUFfS0VYRUNfSU1BR0Ui
Cj4gKwlmaQo+ICsKPiArCSMgU3RyaXAgdGhlIGBCT09UX0lNQUdFPS4uLmAgcGFydCBmcm9tIHRo
ZSBjbWRsaW5lLgo+ICsJbG9jYWwgY21kbGluZT0iJChzZWQgJ3MvQk9PVF9JTUFHRT1bXiBdKiAv
LycgL3Byb2MvY21kbGluZSkiCj4gKwo+ICsJaWYgISBrZXhlYyAtc2wgJElNQV9LRVhFQ19JTUFH
RSAtLXJldXNlLWNtZGxpbmU7IHRoZW4KPiArCQl0c3RfcmVzIFRDT05GICJrZXhlYyBmYWlsZWQ6
ICQ/Igo+ICsKPiArCQlsb2NhbCBzYl9zdGF0dXM9IiQoYm9vdGN0bCBzdGF0dXMgMj4vZGV2L251
bGwgfCBncmVwICdTZWN1cmUgQm9vdCcgXAo+ICsJCQl8IHRyIC1kICcgJyB8IHNlZCAncy9TZWN1
cmVCb290OiovLycpIgo+ICsKPiArCQlpZiBbICIkc2Jfc3RhdHVzIiA9ICJlbmFibGVkIiBdOyB0
aGVuCj4gKwkJCXRzdF9yZXMgVElORk8gInNlY3VyZSBib290IGlzIGVuYWJsZWQsIHRoZSBzcGVj
aWZpZWQga2VybmVsIGltYWdlIG1heSBub3QgYmUgc2lnbmVkIgo+ICsJCWZpCgpJbmRlcGVuZGVu
dGx5IG9mIHRoZSBzZWN1cmUgYm9vdCBzdGF0dXMsIHRoZSBJTUEgcG9saWN5IGl0c2VsZiBjb3Vs
ZCByZXF1aXJlIGEgc2lnbmF0dXJlLgoKRm9yIGV4YW1wbGUsIGEgcmVjZW50IHNvZnR3YXJlIHVw
ZGF0ZSBpcyBwcmV2ZW50aW5nIG9uZSBvZiBteSB0ZXN0CmxhcHRvcHMgZnJvbSBib290aW5nIHdp
dGggc2VjdXJlIGJvb3QgZW5hYmxlZCwgYnV0IHRoZSBjdXN0b20gSU1BCnBvbGljeSBzdGlsbCBy
ZXF1aXJlcyB0aGUga2V4ZWMga2VybmVsIGltYWdlIHRvIGJlIHNpZ25lZC4KClNlYXJjaCB0aGUg
SU1BIHBvbGljeSBmb3IgYW4gYXBwcmFpc2UgImZ1bmM9S0VYRUNfS0VSTkVMX0NIRUNLIiBwb2xp
Y3kKcnVsZS4KCj4gKwo+ICsJCXJldHVybgo+ICsJZmkKPiArCj4gKwlrZXhlYyAtc3UKPiArCj4g
KwlpZiAhIG1lYXN1cmUgIiRjbWRsaW5lIjsgdGhlbgo+ICsJCXRzdF9yZXMgVEZBSUwgInVuYWJs
ZSB0byBmaW5kIGEgY29ycmVjdCBlbnRyeSBpbiB0aGUgSU1BIGxvZyIKPiArCj4gKwkJY2hlY2tf
cG9saWN5X3JlYWRhYmxlCj4gKwo+ICsJCWlmICEgZ3JlcCAibWVhc3VyZSBmdW5jPUtFWEVDX0NN
RExJTkUiICRJTUFfUE9MSUNZID4vZGV2L251bGw7IHRoZW4KPiArCQkJdHN0X2JyayBUQ09ORiAi
VGhlIElNQSBwb2xpY3kgZG9lcyBub3Qgc3BlY2lmeSAnbWVhc3VyZSBmdW5jPUtFWEVDX0NNRExJ
TkUnLCBzZWUgSU1BIHRlc3QgUkVBRE1FIgo+ICsJCWZpCj4gKwoKT3RoZXIgdGhhbiB0aGUgcG9s
aWN5ICJhY3Rpb24iIC0gbWVhc3VyZS9kb250X21lYXN1cmUsCmF1ZGl0L2RvbnRfYXVkaXQsIGFw
cHJhaXNlL2RvbnRfYXBwcmFpc2UgLSBiZWluZyB0aGUgZmlyc3Qga2V5d29yZCwKdGhlIG9yZGVy
aW5nIG9mIHRoZSBwb2xpY3kgb3B0aW9ucyBhbmQgZmxhZ3MgaXMgZmxleGlibGUuIMKgTW9zdApw
b2xpY2llcyBkbyBwcm92aWRlIHRoZSAiZnVuYyIgb3B0aW9uIGltbWVkaWF0ZWx5IGZvbGxvd2lu
ZyB0aGUKImFjdGlvbiIuIMKgVGhpcyB3b3VsZCBub3JtYWxseSB3b3JrLgoKCj4gKwkJcmV0dXJu
Cj4gKwlmaQo+ICsKPiArCWNtZGxpbmU9ImZvbyIKPiArCWlmICEga2V4ZWMgLXNsICRJTUFfS0VY
RUNfSU1BR0UgLS1hcHBlbmQ9JGNtZGxpbmU7IHRoZW4KPiArCQl0c3RfYnJrIFRDT05GICJrZXhl
YyBmYWlsZWQ6ICQ/Igo+ICsJZmkKPiArCgpUaGUgZXJyb3IgbWVzc2FnZXMgYXJlIGV4YWN0bHkg
dGhlIHNhbWUgaGVyZSBhbmQgYmVsb3cuIMKgU2hvdWxkIGEgaGludApiZSBwcm92aWRlZCBhcyB0
byB3aGljaCBvbmUgZmFpbGVkPwoKTWltaQoKPiArCWtleGVjIC1zdQo+ICsKPiArCWlmICEgbWVh
c3VyZSAiJGNtZGxpbmUiOyB0aGVuCj4gKwkJdHN0X2JyayBURkFJTCAidW5hYmxlIHRvIGZpbmQg
YSBjb3JyZWN0IGVudHJ5IGluIHRoZSBJTUEgbG9nIgo+ICsJZmkKPiArCj4gKwljbWRsaW5lPSJi
YXIiCj4gKwlpZiAhIGtleGVjIC1zbCAkSU1BX0tFWEVDX0lNQUdFIC0tY29tbWFuZC1saW5lPSRj
bWRsaW5lOyB0aGVuCj4gKwkJdHN0X2JyayBUQ09ORiAia2V4ZWMgZmFpbGVkOiAkPyIKPiArCWZp
Cj4gKwo+ICsJa2V4ZWMgLXN1Cj4gKwo+ICsJaWYgISBtZWFzdXJlICIkY21kbGluZSI7IHRoZW4K
PiArCQl0c3RfYnJrIFRGQUlMICJ1bmFibGUgdG8gZmluZCBhIGNvcnJlY3QgZW50cnkgaW4gdGhl
IElNQSBsb2ciCj4gKwlmaQo+ICsKPiArCXRzdF9yZXMgVFBBU1MgImtleGVjIGNtZGxpbmUgd2Fz
IG1lYXN1cmVkIGNvcnJlY3RseSIKPiArfQo+ICsKPiArdHN0X3J1bgoKCi0tIApNYWlsaW5nIGxp
c3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
