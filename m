Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E65B61E4C2B
	for <lists+linux-ltp@lfdr.de>; Wed, 27 May 2020 19:41:34 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7DC663C3229
	for <lists+linux-ltp@lfdr.de>; Wed, 27 May 2020 19:41:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 7E77B3C320D
 for <ltp@lists.linux.it>; Wed, 27 May 2020 19:41:32 +0200 (CEST)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 3E732201445
 for <ltp@lists.linux.it>; Wed, 27 May 2020 19:41:28 +0200 (CEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04RHVtfX109827; Wed, 27 May 2020 13:41:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=fWXCF03RRSSnsjJCyoWRsfQVSY3s9+re/ycDQN0vrck=;
 b=QFW6e1AmZCoQ/jMR4e7ClRVQTUv9qfs2qtVkE6/z8tbO+QsiIh5E1vWDe/iF4B6R3jkh
 HrCAWOF24+lI7hKhU1waJy9lwAKRh+NSXw48TqhYpOSw2ZQ4ijYIYtQfIXHs4wMgwbCN
 hKZezIxs9jsNBMPU1SySs1tb5PsGW2pqLN26VbKYW8Et9PV7+M7xuc2Nnuh7JDhxghN3
 mZsrsQEvNtlayK+QQdOXF4PeRDuba+5M1FymQ82kNG18lP+2GVSaec/k3nU8eqcWPftT
 CLId0lQTq54S0WpK+AQ0sabx5elOIgeSThDjL/WtPpWKUh8LbKF3P7eO5mRBDRqcpGu1 5A== 
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 319svy6a18-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 May 2020 13:41:26 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 04RHZxRu005485;
 Wed, 27 May 2020 17:41:24 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma04fra.de.ibm.com with ESMTP id 316uf8bc4p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 May 2020 17:41:24 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 04RHfMgv61800732
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 May 2020 17:41:22 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E76E1A405C;
 Wed, 27 May 2020 17:41:21 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2D597A405B;
 Wed, 27 May 2020 17:41:21 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.85.130.2])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 27 May 2020 17:41:21 +0000 (GMT)
Message-ID: <1590601280.16219.1.camel@linux.ibm.com>
From: Mimi Zohar <zohar@linux.ibm.com>
To: Petr Vorel <pvorel@suse.cz>, ltp@lists.linux.it
Date: Wed, 27 May 2020 13:41:20 -0400
In-Reply-To: <20200527071434.28574-1-pvorel@suse.cz>
References: <20200527071434.28574-1-pvorel@suse.cz>
X-Mailer: Evolution 3.20.5 (3.20.5-1.fc24) 
Mime-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-05-27_03:2020-05-27,
 2020-05-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 impostorscore=0 bulkscore=0 suspectscore=0 cotscore=-2147483648
 clxscore=1011 mlxscore=0 malwarescore=0 lowpriorityscore=0 mlxlogscore=999
 priorityscore=1501 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2005270133
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [LTP v2 1/1] ima_tpm.sh: Fix for calculating boot
 aggregate
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
Cc: linux-integrity@vger.kernel.org, Mimi Zohar <zohar@linux.vnet.ibm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkgUGV0ciwKCk9uIFdlZCwgMjAyMC0wNS0yNyBhdCAwOToxNCArMDIwMCwgUGV0ciBWb3JlbCB3
cm90ZToKPiBGaXhlcyB0ZXN0IGZvciBrZXJuZWwgY29tbWl0OiA2ZjFhMWQxMDNiNDggaW1hOiAo
IlN3aXRjaCB0bwo+IGltYV9oYXNoX2FsZ28gZm9yIGJvb3QgYWdncmVnYXRlIikgZnJvbSBjdXJy
ZW50IGxpbnV4LWludGVncml0eSB0cmVlLgo+IAo+IFRlc3RzIHdhcyBmYWlsaW5nLCBiZWNhdXNl
IGl0IGV4cGVjdCBTSEExIGhhc2gsIGJ1dCBmb3IgVFBNIDIuMCBpcwo+IG5vdyB1c2VkIElNQSBk
ZWZhdWx0IGhhc2ggYWxnb3JpdGhtIChieSBkZWZhdWx0IGRlZmF1bHQgU0hBMjU2KS4KPiBUaGlz
IGlzIHNpbWlsYXIgZm9yIGVudHJpZXMgaW4gSU1BIG1lYXN1cmVtZW50IGxpc3Qgc28gd2UgY2Fu
IHJldXNlCj4gYWxyZWFkeSBleGlzdGluZyBjb2RlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFBldHIg
Vm9yZWwgPHB2b3JlbEBzdXNlLmN6Pgo+IC0tLQo+IGNoYW5nZXMgdjEtPnYyOgo+ICogcmVtb3Zp
bmcgZ2xvYmFsIHZhcmlhYmxlcyBmcm9tIGdldF9hbGdvcml0aG1fZGlnZXN0IChob3BlZnVsbHkg
aXQncwo+IGxlc3MgdWdseSkKPiAKPiBUZXN0ZWQgb25seSBvbiBWTS4gQ2FuIGFueWJvZHkgdGVz
dCBpdCBvbiByZWFsIEhXPwoKV2l0aCBqdXN0IHRoaXMgY2hhbmdlLCB0aGUgaW1hX3RwbS5zaCB0
ZXN0IGlzIGZhaWxpbmcuIMKgSSBhc3N1bWUgaXQgaXMKZmFpbGluZyBiZWNhdXNlIGl0IGlzIHJl
YWRpbmcgdGhlIFNIQTEgVFBNIGJhbmssIG5vdCB0aGUgU0hBMjU2IGJhbmsKdG8gY2FsY3VsYXRl
IHRoZSBib290X2FnZ3JlZ2F0ZSBoYXNoLgoKaW1hX3RwbSAxIFRJTkZPOiB0aW1lb3V0IHBlciBy
dW4gaXMgMGggNW0gMHMKaW1hX3RwbSAxIFRJTkZPOiBJTUEga2VybmVsIGNvbmZpZzoKaW1hX3Rw
bSAxIFRJTkZPOiBDT05GSUdfSU1BPXkKaW1hX3RwbSAxIFRJTkZPOiBDT05GSUdfSU1BX01FQVNV
UkVfUENSX0lEWD0xMAppbWFfdHBtIDEgVElORk86IENPTkZJR19JTUFfTFNNX1JVTEVTPXkKaW1h
X3RwbSAxIFRJTkZPOiBDT05GSUdfSU1BX05HX1RFTVBMQVRFPXkKaW1hX3RwbSAxIFRJTkZPOiBD
T05GSUdfSU1BX0RFRkFVTFRfVEVNUExBVEU9ImltYS1uZyIKaW1hX3RwbSAxIFRJTkZPOiBDT05G
SUdfSU1BX0RFRkFVTFRfSEFTSF9TSEEyNTY9eQppbWFfdHBtIDEgVElORk86IENPTkZJR19JTUFf
REVGQVVMVF9IQVNIPSJzaGEyNTYiCmltYV90cG0gMSBUSU5GTzogQ09ORklHX0lNQV9XUklURV9Q
T0xJQ1k9eQppbWFfdHBtIDEgVElORk86IENPTkZJR19JTUFfUkVBRF9QT0xJQ1k9eQppbWFfdHBt
IDEgVElORk86IENPTkZJR19JTUFfQVBQUkFJU0U9eQppbWFfdHBtIDEgVElORk86IENPTkZJR19J
TUFfQVJDSF9QT0xJQ1k9eQppbWFfdHBtIDEgVElORk86IENPTkZJR19JTUFfVFJVU1RFRF9LRVlS
SU5HPXkKaW1hX3RwbSAxIFRJTkZPOiBDT05GSUdfSU1BX01FQVNVUkVfQVNZTU1FVFJJQ19LRVlT
PXkKaW1hX3RwbSAxIFRJTkZPOiBDT05GSUdfSU1BX1FVRVVFX0VBUkxZX0JPT1RfS0VZUz15Cmlt
YV90cG0gMSBUSU5GTzogQ09ORklHX0lNQV9TRUNVUkVfQU5EX09SX1RSVVNURURfQk9PVD15Cmlt
YV90cG0gMSBUSU5GTzogL3Byb2MvY21kbGluZTogQk9PVF9JTUFHRT0vYm9vdC92bWxpbnV6LTUu
Ni4wLXJjMysuc2lnbmVkIHJvb3Q9VVVJRD0xMTlmMWE3OS1jMzkxLTRlMzctOTA1ZC0zYTUwMzI4
NGNhZGIgcm8gcXVpZXQgc3BsYXNoIGltYS1wb2xpY3k9dGNiCmltYV90cG0gMSBUSU5GTzogdmVy
aWZ5IGJvb3QgYWdncmVnYXRlCmltYV90cG0gMSBUSU5GTzogdXNlZCBhbGdvcml0aG06IHNoYTI1
NgppbWFfdHBtIDEgVElORk86IElNQSBib290IGFnZ3JlZ2F0ZTogJ2IyMzQxZTRjY2VhMjViZTdm
YTc1MDgzMGZiNWZkZjRiZWYxYzQ0YTQnCmltYV90cG0gMSBURkFJTDogYmlvcyBib290IGFnZ3Jl
Z2F0ZSBkb2VzIG5vdCBtYXRjaCBJTUEgYm9vdCBhZ2dyZWdhdGUgKDNmZDVkYzcxN2Y4ODZmZjcx
ODI1MjZlZmM1ZWRjM2FiYjE3OWE1YWFjMWFiNTg5YzhlYzg4ODM5ODIzM2FlNWIpCmltYV90cG0g
MiBUSU5GTzogdmVyaWZ5IFBDUiB2YWx1ZXMKaW1hX3RwbSAyIFRJTkZPOiBldm1jdGwgdmVyc2lv
bjogZXZtY3RsIDEuMgppbWFfdHBtIDIgVENPTkY6IFRQTSBIYXJkd2FyZSBTdXBwb3J0IG5vdCBl
bmFibGVkIGluIGtlcm5lbCBvciBubyBUUE0gY2hpcCBmb3VuZAppbWFfdHBtIDMgVElORk86IEFw
cEFybW9yIGVuYWJsZWQsIHRoaXMgbWF5IGFmZmVjdCB0ZXN0IHJlc3VsdHMKaW1hX3RwbSAzIFRJ
TkZPOiBpdCBjYW4gYmUgZGlzYWJsZWQgd2l0aCBUU1RfRElTQUJMRV9BUFBBUk1PUj0xIChyZXF1
aXJlcyBzdXBlci9yb290KQppbWFfdHBtIDMgVElORk86IGxvYWRlZCBBcHBBcm1vciBwcm9maWxl
czogbm9uZQoKU3VtbWFyeToKcGFzc2VkICAgMApmYWlsZWQgICAxCnNraXBwZWQgIDEKd2Fybmlu
Z3MgMAoKIyBoZWFkIC0xIC9zeXMva2VybmVsL3NlY3VyaXR5L2ltYS9hc2NpaV9ydW50aW1lX21l
YXN1cmVtZW50cwoKMTAgYTMxMzJkMjUwMTEyOGZmNTI3MTcxNjU4ZDQwZDhkZWI2MWUyMjkyYiBp
bWEtbmcKc2hhMjU2OjNmZDVkYzcxN2Y4ODZmZjcxODI1MjZlZmM1ZWRjM2FiYjE3OWE1YWFjMWFi
NTg5YzhlYzg4ODM5ODIzM2FlNQpiIGJvb3RfYWdncmVnYXRlCgpUaGUgaW1hLWV2bS11dGlscyBu
ZXh0LXRlc3RpbmcgYnJhbmNoIGhhcyBjb2RlIHRvIGNhbGN1bGF0ZSB0aGUKYm9vdF9hZ2dyZWdh
dGUgYmFzZWQgb24gbXVsdGlwbGUgYmFua3MuCgojIGV2bWN0bCBpbWFfYm9vdF9hZ2dyZWdhdGUK
CnNoYTE6NGNmM2QxMDViMWExYTQxYjk1MWNjNjQzMWYwODAxYzAxZmU1MGIyNApzaGEyNTY6M2Zk
NWRjNzE3Zjg4NmZmNzE4MjUyNmVmYzVlZGMzYWJiMTc5YTVhYWMxYWI1ODljOGVjODg4Mzk4MjMz
YWU1YgoKVGhlcmUncyBhbHNvIGEgbmV3IHRlc3QgdG8gdmVyaWZ5IHRoZSBib290X2FnZ3JlZ2F0
ZS4KCiQgVkVSQk9TRT0xIG1ha2UgY2hlY2sgVEVTVFM9Ym9vZ19hZ2dyZWdhdGUudGVzdAoKQm90
aCBuZWVkIHNvbWUgcmV2aWV3IGFuZCB0ZXN0aW5nIGJlZm9yZSBiZWluZyByZWxlYXNlZC4KCnRo
YW5rcywKCk1pbWkKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5p
dC9saXN0aW5mby9sdHAK
