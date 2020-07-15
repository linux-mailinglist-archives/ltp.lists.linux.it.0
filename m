Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E302221545
	for <lists+linux-ltp@lfdr.de>; Wed, 15 Jul 2020 21:41:04 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4D9E53C2C1C
	for <lists+linux-ltp@lfdr.de>; Wed, 15 Jul 2020 21:41:04 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id A44AA3C29A2
 for <ltp@lists.linux.it>; Wed, 15 Jul 2020 21:41:03 +0200 (CEST)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id C2B011A009A0
 for <ltp@lists.linux.it>; Wed, 15 Jul 2020 21:41:02 +0200 (CEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06FJXbbx096489; Wed, 15 Jul 2020 15:40:59 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 329uehsv6k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Jul 2020 15:40:59 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06FJc6qX024220;
 Wed, 15 Jul 2020 19:40:56 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma06ams.nl.ibm.com with ESMTP id 3274pgvp0t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Jul 2020 19:40:56 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06FJesgI43843690
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Jul 2020 19:40:54 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 924864C04A;
 Wed, 15 Jul 2020 19:40:54 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 73CDA4C044;
 Wed, 15 Jul 2020 19:40:53 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.85.155.184])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 15 Jul 2020 19:40:53 +0000 (GMT)
Message-ID: <1594842052.12900.337.camel@linux.ibm.com>
From: Mimi Zohar <zohar@linux.ibm.com>
To: Lachlan Sneff <t-josne@linux.microsoft.com>, pvorel@suse.cz,
 ltp@lists.linux.it
Date: Wed, 15 Jul 2020 15:40:52 -0400
In-Reply-To: <53323968-55b9-68ae-dc3f-de9cbd223ff1@linux.microsoft.com>
References: <20200702153545.3126-1-t-josne@linux.microsoft.com>
 <20200702153545.3126-2-t-josne@linux.microsoft.com>
 <1594774692.12900.220.camel@linux.ibm.com>
 <53323968-55b9-68ae-dc3f-de9cbd223ff1@linux.microsoft.com>
X-Mailer: Evolution 3.20.5 (3.20.5-1.fc24) 
Mime-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-15_12:2020-07-15,
 2020-07-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 phishscore=0 adultscore=0
 suspectscore=0 mlxlogscore=999 clxscore=1015 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007150147
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] IMA: Verify that the kernel cmdline is passed
 and measured correctly through the kexec barrier.
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

T24gV2VkLCAyMDIwLTA3LTE1IGF0IDE1OjM4IC0wNDAwLCBMYWNobGFuIFNuZWZmIHdyb3RlOgo+
IE9uIDcvMTQvMjAgODo1OCBQTSwgTWltaSBab2hhciB3cm90ZToKPiA+IE9uIFRodSwgMjAyMC0w
Ny0wMiBhdCAxMTozNSAtMDQwMCwgTGFjaGxhbiBTbmVmZiB3cm90ZToKPiA+PiBBZGQgYSB0ZXN0
Y2FzZSB0aGF0IHZlcmlmaWVzIHRoYXQga2V4ZWMgY29ycmVjdGx5IGxvZ3MgdGhlCj4gPj4ga2Vy
bmVsIGNvbW1hbmQgbGluZSB0byB0aGUgSU1BIGJ1ZmZlciBhbmQgdGhhdCB0aGUgY29tbWFuZAo+
ID4+IGxpbmUgaXMgdGhlbiBjb3JyZWN0bHkgbWVhc3VyZWQuCj4gPj4KPiA+PiBUaGlzIHRlc3Qg
bXVzdCBiZSBydW4gc3RhbmRhbG9uZSwgc2luY2UgaXQgcnVucyBrZXhlYwo+ID4+IG11bHRpcGxl
IHRpbWVzIChhbmQgdGhlcmVmb3JlIHJlYm9vdHMgc2V2ZXJhbCB0aW1lcykuCj4gPiBWZXJpZnlp
bmcgdGhlIGtleGVjIGJvb3QgY29tbWFuZCBsaW5lIGRvZXNuJ3QgcmVxdWlyZSByZWJvb3Rpbmcu
IMKgSnVzdAo+ID4gbG9hZGluZyB0aGUga2V4ZWMga2VybmVsIGltYWdlIHNob3VsZCBiZSBlbm91
Z2ggKGtleGVjIC1zIC1sKS4KPiA+ICDCoFZlcmlmeWluZyB0aGF0IHRoZSBtZWFzdXJlbWVudCBs
aXN0LCBpbmNsdWRpbmcgdGhlIGtleGVjIGJvb3QgY29tbWFuZAo+ID4gbGluZSwgaXMgY2Fycmll
ZCBhY3Jvc3Mga2V4ZWMgY291bGQgYmUgYSBzZXBhcmF0ZSB0ZXN0Lgo+IAo+IFRoaXMgaXMgdHJ1
ZS4gSG93ZXZlciwgaXQgb25seSBhcHBlbmRzIHRvIHRoZSBJTUEgbG9nIG9uY2UsIGV2ZW4gaWYg
eW91IAo+IHVubG9hZCAoYGtleGVjIC11YCkgdGhlIGtleGVjIGtlcm5lbCBhZnRlciBga2V4ZWMg
LXMgLWwgLi4uYC4KPiAKPiBUaGVyZWZvcmUsIHRoZSB0ZXN0IHdvdWxkIG9ubHkgYmUgYWJsZSB0
byBjaGVjayBrZXhlYyB3aXRoIHRoZSBjbWRsaW5lIAo+IHN1cHBsaWVkIGluIG9uZSB3YXkuCj4g
Cj4gSSB3aWxsIGhhdmUgdG8gY2hlY2sgaW50ZXJuYWxseSBpZiB0aGF0J3MgdGhlIHJpZ2h0IHdh
eSB0byBnby4gSWYgaXQgCj4gZGlkbid0IG5lZWQgdG8gcmVib290LCB0aGVuIHRoZSB0ZXN0IGNv
dWxkIGJlIGludGVncmF0ZWQgaW50byB0aGUgbm9ybWFsIAo+IElNQSB0ZXN0cywKPiB3aGljaCB3
b3VsZCBkZWZpbml0ZWx5IGJlIGEgZ29vZCB0aGluZy4KCkZvciBmaWxlcywgdGhlcmUgaXMgYSBz
aW5nbGUgbWVhc3VyZW1lbnQgdW5sZXNzIHRoZSBmaWxlIGNoYW5nZXMuICBJCndvdWxkIGFzc3Vt
ZSB0aGF0IHdvdWxkIGJlIHRoZSBzYW1lIGZvciB0aGUga2V4ZWMgY29tbWFuZCBsaW5lIGFzCndl
bGwuIMKgWW91IGNvdWxkIG1vZGlmeSB0aGUgY29tbWFuZCBsaW5lIGEgYml0IHRvIGZvcmNlIGl0
IHRvIGJlIHJlLQptZWFzdXJlZC4KCk1pbWkKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6
Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
