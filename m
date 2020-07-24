Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE2622CA1F
	for <lists+linux-ltp@lfdr.de>; Fri, 24 Jul 2020 18:07:07 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CBEFB3C4D04
	for <lists+linux-ltp@lfdr.de>; Fri, 24 Jul 2020 18:07:06 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 554F13C18FA
 for <ltp@lists.linux.it>; Fri, 24 Jul 2020 18:07:05 +0200 (CEST)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 91E06605642
 for <ltp@lists.linux.it>; Fri, 24 Jul 2020 18:05:45 +0200 (CEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06OFXnMJ103421; Fri, 24 Jul 2020 12:07:01 -0400
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32facf600k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Jul 2020 12:07:00 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06OG5CHL007680;
 Fri, 24 Jul 2020 16:06:58 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03fra.de.ibm.com with ESMTP id 32brq844a7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Jul 2020 16:06:58 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06OG6t7B32702912
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 24 Jul 2020 16:06:56 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D90F0A405C;
 Fri, 24 Jul 2020 16:06:55 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 00558A4068;
 Fri, 24 Jul 2020 16:06:55 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.85.202.187])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 24 Jul 2020 16:06:54 +0000 (GMT)
Message-ID: <1595606814.5211.251.camel@linux.ibm.com>
From: Mimi Zohar <zohar@linux.ibm.com>
To: Petr Vorel <pvorel@suse.cz>
Date: Fri, 24 Jul 2020 12:06:54 -0400
In-Reply-To: <20200724131845.GB24626@dell5510>
References: <20200724070038.29491-1-pvorel@suse.cz>
 <20200724070038.29491-2-pvorel@suse.cz>
 <1595592111.5211.246.camel@linux.ibm.com> <20200724131845.GB24626@dell5510>
X-Mailer: Evolution 3.20.5 (3.20.5-1.fc24) 
Mime-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-24_05:2020-07-24,
 2020-07-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 spamscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 malwarescore=0 suspectscore=0 adultscore=0 clxscore=1015
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007240122
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
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
Cc: balajib@linux.microsoft.com,
 Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
 Mimi Zohar <zohar@linux.vnet.ibm.com>, linux-integrity@vger.kernel.org,
 ltp@lists.linux.it
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

T24gRnJpLCAyMDIwLTA3LTI0IGF0IDE1OjE4ICswMjAwLCBQZXRyIFZvcmVsIHdyb3RlOgoKPiAK
PiA+IE90aGVyIHRoYW4gdGhlIHBvbGljeSAiYWN0aW9uIiAtIG1lYXN1cmUvZG9udF9tZWFzdXJl
LAo+ID4gYXVkaXQvZG9udF9hdWRpdCwgYXBwcmFpc2UvZG9udF9hcHByYWlzZSAtIGJlaW5nIHRo
ZSBmaXJzdCBrZXl3b3JkLAo+ID4gdGhlIG9yZGVyaW5nIG9mIHRoZSBwb2xpY3kgb3B0aW9ucyBh
bmQgZmxhZ3MgaXMgZmxleGlibGUuIMKgTW9zdAo+ID4gcG9saWNpZXMgZG8gcHJvdmlkZSB0aGUg
ImZ1bmMiIG9wdGlvbiBpbW1lZGlhdGVseSBmb2xsb3dpbmcgdGhlCj4gPiAiYWN0aW9uIi4gwqBU
aGlzIHdvdWxkIG5vcm1hbGx5IHdvcmsuCj4gT0ssIGlzIHRoaXMgY29ycmVjdD8KPiBpZiAhIGdy
ZXAgJ15tZWFzdXJlLipmdW5jPUtFWEVDX0NNRExJTkUnICRJTUFfUE9MSUNZID4vZGV2L251bGw7
IHRoZW4KClllcywgdGhhdCB3b3Jrcy4KCj4gCj4gQE1pbWksIEBMYWNobGFuOiBpZiB5b3UgYm90
aCBhY2sgbXkgY2hhbmdlcywgSSBjYW4gZml4IHRoZSBjb2RlIGJlZm9yZSBtZXJnaW5nLgoKVGhh
dCdzIGZpbmUuIEZlZWwgZnJlZSB0byBhZGQgbXkgUmV2aWV3ZWQtYnkuCgpNaW1pCgo+IElmIHRo
ZXJlIGFyZSBtb3JlIGNoYW5nZXMgbmVlZGVkIGFuZCB0aHVzIExhY2hsYW4gcGxhbiBuZXcgdmVy
c2lvbiwgcGxlYXNlIHVzZQo+IG15IHBhdGNoZXMgZnJvbSBodHRwczovL3BhdGNod29yay5vemxh
YnMub3JnL3Byb2plY3QvbHRwL2xpc3QvP3Nlcmllcz0xOTE5OTAmc3RhdGU9Kgo+IChkb3dubG9h
ZCBodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Nlcmllcy8xOTE5OTAvbWJveC8gYW5kIGlt
cG9ydCBpdCB3aXRoICJnaXQgYW0iKQo+IG9yIGNsb25lIG15IGdpdGh1YiBmb3JrIGFuZCB1c2Ug
a2V4ZWMudjMuZml4ZXMgYnJhbmNoOgo+IGh0dHBzOi8vZ2l0aHViLmNvbS9wZXZpay9sdHAvdHJl
ZS9pbWEva2V4ZWMudjMuZml4ZXMpLgoKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9s
aXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
