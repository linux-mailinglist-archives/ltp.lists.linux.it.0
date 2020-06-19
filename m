Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB9B2008EE
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Jun 2020 14:44:10 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6184E3C2C4D
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Jun 2020 14:44:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 23F063C23CD
 for <ltp@lists.linux.it>; Fri, 19 Jun 2020 14:44:07 +0200 (CEST)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 736071A008BE
 for <ltp@lists.linux.it>; Fri, 19 Jun 2020 14:44:07 +0200 (CEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05JCXiEx051063; Fri, 19 Jun 2020 08:44:04 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31runckdpt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Jun 2020 08:44:04 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 05JCYDCj053630;
 Fri, 19 Jun 2020 08:44:04 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31runckdp9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Jun 2020 08:44:03 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05JCZ54g012883;
 Fri, 19 Jun 2020 12:44:02 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma02fra.de.ibm.com with ESMTP id 31r0dvs272-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Jun 2020 12:44:01 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 05JCgfxb60358958
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 19 Jun 2020 12:42:41 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C4B874203F;
 Fri, 19 Jun 2020 12:43:59 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A172B42045;
 Fri, 19 Jun 2020 12:43:58 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.85.188.214])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 19 Jun 2020 12:43:58 +0000 (GMT)
Message-ID: <1592570638.17802.8.camel@linux.ibm.com>
From: Mimi Zohar <zohar@linux.ibm.com>
To: Petr Vorel <pvorel@suse.cz>, Bruno Meneguele <bmeneg@redhat.com>
Date: Fri, 19 Jun 2020 08:43:58 -0400
In-Reply-To: <20200619082134.GB23036@dell5510>
References: <20200527071434.28574-1-pvorel@suse.cz>
 <1590601280.16219.1.camel@linux.ibm.com> <20200528140747.GA8401@dell5510>
 <1590679145.4457.39.camel@linux.ibm.com> <20200528160527.GA27243@dell5510>
 <20200615194134.GF129694@glitch> <1592252491.11061.181.camel@linux.ibm.com>
 <20200617012148.hhpvxqov2py7fvvc@cantor> <20200617204500.GB40831@glitch>
 <20200619082134.GB23036@dell5510>
X-Mailer: Evolution 3.20.5 (3.20.5-1.fc24) 
Mime-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-19_11:2020-06-19,
 2020-06-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=909
 impostorscore=0 priorityscore=1501 mlxscore=0 spamscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 clxscore=1015 bulkscore=0 cotscore=-2147483648 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006190089
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
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
Cc: Vitaly Chikunov <vt@altlinux.org>, Jerry Snitselaar <jsnitsel@redhat.com>,
 Maurizio Drocco <maurizio.drocco@ibm.com>, linux-integrity@vger.kernel.org,
 Mimi Zohar <zohar@linux.vnet.ibm.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

T24gRnJpLCAyMDIwLTA2LTE5IGF0IDEwOjIxICswMjAwLCBQZXRyIFZvcmVsIHdyb3RlOgo+IEhp
IGFsbCwKPiAKPiAuLi4KPiA+ID4gPiBJJ2QgYXBwcmVjaWF0ZSBpZiBzb21lb25lIGNvdWxkIHNl
bmQgbWUgYSBUUE0gZXZlbnQgbG9nLCB0aGUgUENScywgYW5kCj4gPiA+ID4gdGhlIGFzc29jaWF0
ZWQgSU1BIGFzY2lpX3J1bnRpbWVfbWVhc3VyZW1lbnRzICJib290X2FnZ3JlZ2F0ZSIgZnJvbSBh
Cj4gPiA+ID4gc3lzdGVtIHdpdGggYSBkaXNjcmV0ZSBUUE0gMi4wIHdpdGggUENScyA4ICYgOSBl
dmVudHMuCj4gCj4gCj4gPiBNYXliZSBNYXVyaXppbyBhbHJlYWR5IGhhdmUgaXQgYXQgaGFuZD8K
PiBJJ2QgYXBwcmVjaWF0ZSB0byBoYXZlIHRoZXNlIGZpbGVzIGFzIHdlbGwuCj4gCj4gPiBJIGNh
biB0cnkgdG8gc2V0dXAgYSBzeXN0ZW0gd2l0aCBncnViMit0cG0gdG8gZ2V0IHRoZSBsb2cgd2l0
aCBwY3IgOCBhbmQKPiA+IDkgZmlsbGVkLgoKQm90aCBSSEVMIDggYW5kIFVidW50dSAyMC4wNCBM
VFMgaGF2ZSBQQ1JzIDggJiA5LiDCoEknbGwgaW5jbHVkZSBvbmUgYXMKYW5vdGhlciBleGFtcGxl
IGZvciB0aGUgdGVzdHMvYm9vdF9hZ2dyZWdhdGUudGVzdC4KCk1pbWkKCgotLSAKTWFpbGluZyBs
aXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
