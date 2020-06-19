Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A36B020097E
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Jun 2020 15:04:47 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5E1EF3C2C4D
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Jun 2020 15:04:47 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id A8CFA3C1D1C
 for <ltp@lists.linux.it>; Fri, 19 Jun 2020 15:04:45 +0200 (CEST)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id BA3EF200FCA
 for <ltp@lists.linux.it>; Fri, 19 Jun 2020 15:04:44 +0200 (CEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05JD4Sqx095097; Fri, 19 Jun 2020 09:04:42 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31rmmeyufn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Jun 2020 09:04:40 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 05JD4ebk095672;
 Fri, 19 Jun 2020 09:04:40 -0400
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31rmmeytbq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Jun 2020 09:04:40 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05JD0qF1011063;
 Fri, 19 Jun 2020 13:01:55 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03fra.de.ibm.com with ESMTP id 31r0u9h20v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Jun 2020 13:01:55 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05JD1rfk63373344
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 19 Jun 2020 13:01:53 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2B3FEA4040;
 Fri, 19 Jun 2020 13:01:53 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2B990A4057;
 Fri, 19 Jun 2020 13:01:52 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.85.188.214])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 19 Jun 2020 13:01:52 +0000 (GMT)
Message-ID: <1592571711.17802.21.camel@linux.ibm.com>
From: Mimi Zohar <zohar@linux.ibm.com>
To: Petr Vorel <pvorel@suse.cz>
Date: Fri, 19 Jun 2020 09:01:51 -0400
In-Reply-To: <20200619100737.GB18704@dell5510>
References: <20200527071434.28574-1-pvorel@suse.cz>
 <1590601280.16219.1.camel@linux.ibm.com> <20200528140747.GA8401@dell5510>
 <1590679145.4457.39.camel@linux.ibm.com> <20200528160527.GA27243@dell5510>
 <20200615194134.GF129694@glitch> <1592252491.11061.181.camel@linux.ibm.com>
 <20200619100737.GB18704@dell5510>
X-Mailer: Evolution 3.20.5 (3.20.5-1.fc24) 
Mime-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-19_11:2020-06-19,
 2020-06-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0
 bulkscore=0 malwarescore=0 adultscore=0 cotscore=-2147483648
 impostorscore=0 mlxscore=0 mlxlogscore=999 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006190092
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
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
Cc: Vitaly Chikunov <vt@altlinux.org>,
 Maurizio Drocco <maurizio.drocco@ibm.com>, linux-integrity@vger.kernel.org,
 Mimi Zohar <zohar@linux.vnet.ibm.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

T24gRnJpLCAyMDIwLTA2LTE5IGF0IDEyOjA3ICswMjAwLCBQZXRyIFZvcmVsIHdyb3RlOgo+IEhp
IGFsbCwKPiAKPiA+IE9uIE1vbiwgMjAyMC0wNi0xNSBhdCAxNjo0MSAtMDMwMCwgQnJ1bm8gTWVu
ZWd1ZWxlIHdyb3RlOgo+ID4gPiBPbiBUaHUsIE1heSAyOCwgMjAyMCBhdCAwNjowNToyN1BNICsw
MjAwLCBQZXRyIFZvcmVsIHdyb3RlOgo+ID4gPiA+IEhpIE1pbWksCj4gLi4uCj4gPiA+ID4gVG8g
c3VtIHRoYXQ6IG15IHBhdGNoIGlzIHJlcXVpcmVkIGZvciBhbnkgc3lzdGVtIHdpdGhvdXQgcGh5
c2ljYWwgVFBNIHdpdGggd2l0aAo+ID4gPiA+IGtlcm5lbCB3aXRoIGI1OWZkYTQ0OWNmMCArIGl0
IGFsc28gd29ya3MgZm9yIFRQTSAxLjIgKHJlZ2FyZGxlc3Mga2VybmVsCj4gPiA+ID4gdmVyc2lv
biksIGJlY2F1c2UgVFBNIDEuMiBzdXBwb3J0cyBzaGExIG9ubHkgYm9vdCBhZ2dyZWdhdGUuCj4g
Cj4gPiA+ID4gQnV0IHRlc3Rpbmcgb24ga2VybmVsIHdpdGggYjU5ZmRhNDQ5Y2YwIHdpdGggVFBN
IDIuMCBpcyBub3Qgb25seSBicm9rZW4gd2l0aAo+ID4gPiA+IHRoaXMgcGF0Y2gsIGJ1dCBhbHNv
IG9uIGN1cnJlbnQgdmVyc2lvbiBpbiBtYXN0ZXIsIHJpZ2h0PyBBcyB5b3UgaGF2ZQo+ID4gPiA+
IHNoYTI1NjozZmQ1ZGM3MTdmODg2ZmY3MTgyNTI2ZWZjNWVkYzNhYmIxNzlhNWFhYzFhYjU4OWM4
ZWM4ODgzOTgyMzNhZTUgYW55d2F5Lgo+ID4gPiA+IFNvIHRoaXMgcGF0Y2ggd291bGQgaGVscCBh
dCBsZWFzdCB0ZXN0aW5nIG9uIFZNIHdpdGhvdXQgdlRQTS4KPiAKPiAKPiA+ID4gSWYgd2UgY29u
c2lkZXIgdG8gZGVsYXkgdGhpcyBjaGFuZ2UgdW50aWwgd2UgaGF2ZSB0aGUgaW1hLWV2bS11dGls
cwo+ID4gPiByZWxlYXNlZCB3aXRoIHRoZSBpbWFfYm9vdF9hZ2dyZWdhdGUgKyBtYWtlIHRoaXMg
dGVzdCBkZXBlbmRlbnQgb24KPiA+ID4gYm90aCBpbWEtZXZtLXV0aWxzIGFuZCB0c3NwY3JyZWFk
LCB3b3VsZCBpdCBiZSB3b3J0aCB0byBTS0lQIHRoZSB0ZXN0IGluCj4gPiA+IGNhc2UgYSBUUE0y
LjAgc2hhMjU2IGJhbmsgaXMgZGV0ZWN0ZWQgaW5zdGVhZCBvZiBGQUlMPyBUaHVzIHdlIGNvdWxk
Cj4gPiA+IGhhdmUgdGhlIHRlc3QgZml4ZWQgZm9yIFRQTTEuMiAmJiBuby1UUE0gY2FzZXMgdW50
aWwgd2UgZ2V0IHRoZSBmdWxsCj4gPiA+IHN1cHBvcnQgZm9yIG11bHRpcGxlIGJhbmtzPwo+ICsx
Cj4gCj4gPiBBcyBsb25nIGFzIHdlJ3JlIGRlYWxpbmcgd2l0aCB0aGUgImJvb3RfYWdncmVnYXRl
IiwgTWF1cml6aW8ganVzdAo+ID4gcG9zdGVkIGEga2VybmVsIHBhdGNoIGZvciBpbmNsdWRpbmcg
UENSIDggJiA5IGluIHRoZSBib290X2FnZ3JlZ2F0ZS4KPiA+IMKgVGhlIGV4aXN0aW5nIElNQSBM
VFAgImJvb3RfYWdncmVnYXRlIiB0ZXN0IGlzIGdvaW5nIHRvIG5lZWQgdG8KPiA+IHN1cHBvcnQg
dGhpcyBjaGFuZ2UuCj4gSSdtIG5vdCBzdXJlIGlmIEkgZGlkIHNvbWV0aGluZyB3cm9uZywgYnV0
IGl0IGxvb2tzIHRvIG1lIHRoYXQgJ2V2bWN0bAo+IGltYV9ib290X2FnZ3JlZ2F0ZScgZG9lcyBu
b3QgcHJvdmlkZSBiYWNrd2FyZCBjb21wYXRpYmlsaXR5IHdpdGggVFBNIDEuMi4KPiBPciBhbSBJ
IHdyb25nPwoKQ2FsY3VsYXRpbmcgdGhlICJib290X2FnZ3JlZ2F0ZSIgLSAiZXZtY3RsIGltYV9i
b290X2FnZ3JlZ2F0ZSIgLSBmb3IKVFBNIDEuMiBzaG91bGQgd29yay4gwqBSZWFkaW5nIHRoZSBj
b2RlLCBpdCBsb29rcyBsaWtlIGl0IGFzc3VtZXMgdGhhdAp0aGUgY3J5cHRvIGxpYnJhcnkgc3Vw
cG9ydHMgU0hBMSBhbmQgU0hBMjU2LiDCoFRoYXQgYXNzdW1wdGlvbiBuZWVkcyB0bwpiZSBhZGRy
ZXNzZWQuCgpUaGUgdGVzdHMvYm9vdF9hZ2dyZWdhdGUudGVzdCBsb2dzIGFyZSBUUE0gMi4wLiDC
oFRoZSB0ZXN0IGlzIGZhaWxpbmcKb24gc3lzdGVtcyB3aXRoIGEgVFBNIDEuMi4gwqBJJ20gd29y
a2luZyBvbiBhIGZpeCBmb3IgdGhpcy4KCk1pbWkKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0
cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
