Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id EC8A5207C94
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Jun 2020 22:02:58 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 84ACC3C58F2
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Jun 2020 22:02:58 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 8E9473C0ECB
 for <ltp@lists.linux.it>; Wed, 24 Jun 2020 22:02:54 +0200 (CEST)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 4E45B600B6E
 for <ltp@lists.linux.it>; Wed, 24 Jun 2020 22:02:52 +0200 (CEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05OK1POd189367; Wed, 24 Jun 2020 16:02:49 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 31uwyye319-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Jun 2020 16:02:49 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05OJfj2F001152;
 Wed, 24 Jun 2020 20:02:47 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma06ams.nl.ibm.com with ESMTP id 31uusjgyd4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Jun 2020 20:02:47 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 05OK1QjI52560220
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 24 Jun 2020 20:01:26 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6B1B552063;
 Wed, 24 Jun 2020 20:02:45 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.85.142.225])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 642E35204F;
 Wed, 24 Jun 2020 20:02:44 +0000 (GMT)
Message-ID: <1593028963.27152.153.camel@linux.ibm.com>
From: Mimi Zohar <zohar@linux.ibm.com>
To: Lachlan Sneff <t-josne@linux.microsoft.com>, ltp@lists.linux.it,
 pvorel@suse.cz
Date: Wed, 24 Jun 2020 16:02:43 -0400
In-Reply-To: <20418d14-d464-ec09-e1f2-c1b96e9df5f6@linux.microsoft.com>
References: <20200617234957.10611-1-t-josne@linux.microsoft.com>
 <20200617234957.10611-3-t-josne@linux.microsoft.com>
 <1593016868.27152.88.camel@linux.ibm.com>
 <20418d14-d464-ec09-e1f2-c1b96e9df5f6@linux.microsoft.com>
X-Mailer: Evolution 3.20.5 (3.20.5-1.fc24) 
Mime-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-24_15:2020-06-24,
 2020-06-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 cotscore=-2147483648 mlxlogscore=999
 phishscore=0 mlxscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006240128
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
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

T24gV2VkLCAyMDIwLTA2LTI0IGF0IDE1OjU5IC0wNDAwLCBMYWNobGFuIFNuZWZmIHdyb3RlOgo+
IAo+ID4+IGRpZmYgLS1naXQgYS90ZXN0Y2FzZXMva2VybmVsL3NlY3VyaXR5L2ludGVncml0eS9p
bWEvUkVBRE1FLm1kIGIvdGVzdGNhc2VzL2tlcm5lbC9zZWN1cml0eS9pbnRlZ3JpdHkvaW1hL1JF
QURNRS5tZAo+ID4+IGluZGV4IDE2YTFmNDhjMy4uZTQxZjdiNTcwIDEwMDY0NAo+ID4+IC0tLSBh
L3Rlc3RjYXNlcy9rZXJuZWwvc2VjdXJpdHkvaW50ZWdyaXR5L2ltYS9SRUFETUUubWQKPiA+PiAr
KysgYi90ZXN0Y2FzZXMva2VybmVsL3NlY3VyaXR5L2ludGVncml0eS9pbWEvUkVBRE1FLm1kCj4g
Pj4gQEAgLTE2LDYgKzE2LDI3IEBAIENPTkZJR19JTlRFR1JJVFk9eQo+ID4+ICAgQ09ORklHX0lN
QT15Cj4gPj4gICBgYGAKPiA+PiAgIAo+ID4+ICtJTUEgS2V5IEltcG9ydCB0ZXN0Cj4gPj4gKy0t
LS0tLS0tLS0tLS0KPiA+PiArCj4gPj4gK2BpbWFfa2V5cy5zaGAgcmVxdWlyZXMgYW4geDUwOSBr
ZXkgdG8gYmUgZ2VuZXJhdGVkIGFuZCBwbGFjZWQKPiA+PiArYXQgYC9ldGMva2V5cy94NTA5X2lt
YS5kZXJgLgo+ID4gVGhlIGZpbGVuYW1lICIvZXRjL2tleXMveDUwOV9pbWEuZGVyIiBpcyBjb25m
aWd1cmFibGUuIMKgSXQncyBiYXNlZCBvbgo+ID4gQ09ORklHX0lNQV9YNTA5X1BBVEggS2NvbmZp
ZyBvcHRpb24uIMKgUGVyaGFwcyBleHRyYWN0IGl0IGZyb20gdGhlCj4gPiBydW5uaW5nIGtlcm5l
bCdzIEtjb25maWc/Cj4gSSBkaWRuJ3QgdGhpbmsgcHVsbGluZyBpdCBmcm9tIHRoZSBrZXJuZWwg
Y29uZmlnLiBXaWxsIHRyeSB0aGlzLiBJIAo+IGFzc3VtZSBgZ3JlcCAiLi4uIiAvYm9vdC9jb25m
aWctJCh1bmFtZSAtcilgIGlzIHRoZSByaWdodCB3YXkgdG8gZ3JhYiBhIAo+IGxpbmUgZnJvbSB0
aGUgY29uZmlnPwoKVHJ5IHVzaW5nIHNjcmlwdHMvZXh0cmFjdC1pa2NvbmZpZy4KCk1pbWkKCgot
LSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRw
Cg==
