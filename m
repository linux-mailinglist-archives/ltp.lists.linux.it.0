Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 03EACE4BF5
	for <lists+linux-ltp@lfdr.de>; Fri, 25 Oct 2019 15:22:33 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A8DD53C22C4
	for <lists+linux-ltp@lfdr.de>; Fri, 25 Oct 2019 15:22:32 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 4BB3D3C2266
 for <ltp@lists.linux.it>; Fri, 25 Oct 2019 15:22:29 +0200 (CEST)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 2B430200FC0
 for <ltp@lists.linux.it>; Fri, 25 Oct 2019 15:22:27 +0200 (CEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x9PDKXON004102
 for <ltp@lists.linux.it>; Fri, 25 Oct 2019 09:22:25 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2vv0aek7mx-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <ltp@lists.linux.it>; Fri, 25 Oct 2019 09:22:25 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <ltp@lists.linux.it> from <zohar@linux.ibm.com>;
 Fri, 25 Oct 2019 14:22:22 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 25 Oct 2019 14:22:18 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x9PDMHfP33226838
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 25 Oct 2019 13:22:17 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 66D4711C04C;
 Fri, 25 Oct 2019 13:22:17 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 244EA11C054;
 Fri, 25 Oct 2019 13:22:16 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.85.164.225])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 25 Oct 2019 13:22:16 +0000 (GMT)
From: Mimi Zohar <zohar@linux.ibm.com>
To: "Serge E. Hallyn" <serge@hallyn.com>, Petr Vorel <pvorel@suse.cz>
Date: Fri, 25 Oct 2019 09:22:15 -0400
In-Reply-To: <20191025125202.GA1966@mail.hallyn.com>
References: <1558041162.3971.2.camel@linux.ibm.com>
 <fccc3abd-f3ce-fdb1-55d7-c18ce116446c@linux.vnet.ibm.com>
 <20190517150456.GA11796@dell5510> <20191024121848.GA5908@dell5510>
 <20191024172023.GA7948@linux.intel.com>
 <20191024213842.c6cl4tlnsi56pgcy@cantor>
 <1571964420.5173.12.camel@linux.ibm.com>
 <20191025021159.dt7ifgnebnke6ca7@cantor> <20191025085617.GA13329@x230>
 <20191025125202.GA1966@mail.hallyn.com>
X-Mailer: Evolution 3.20.5 (3.20.5-1.fc24) 
Mime-Version: 1.0
X-TM-AS-GCONF: 00
x-cbid: 19102513-4275-0000-0000-000003778B3E
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19102513-4276-0000-0000-0000388AB934
Message-Id: <1572009735.4532.17.camel@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-25_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=968 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910250127
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] ima: skip verifying TPM 2.0 PCR values
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
Cc: Nayna <nayna@linux.vnet.ibm.com>, Jerry Snitselaar <jsnitsel@redhat.com>,
 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, ltp@lists.linux.it,
 linux-integrity <linux-integrity@vger.kernel.org>,
 Peter Huewe <peterhuewe@gmx.de>,
 Piotr =?ISO-8859-1?Q?Kr=F3l?= <piotr.krol@3mdeb.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

T24gRnJpLCAyMDE5LTEwLTI1IGF0IDA3OjUyIC0wNTAwLCBTZXJnZSBFLiBIYWxseW4gd3JvdGU6
Cj4gT24gRnJpLCBPY3QgMjUsIDIwMTkgYXQgMTA6NTY6MTdBTSArMDIwMCwgUGV0ciBWb3JlbCB3
cm90ZToKPiA+IEhpLAo+ID4gCj4gPiA+IC9zeXMva2VybmVsL3NlY3VyaXR5L3RwbVgvbWFqb3Jf
dmVyc2lvbiAob24gZmVkb3JhIGFuZCByaGVsIGF0Cj4gbGVhc3QsIGlzIGl0IGVsc2V3aGVyZSBv
biBvdGhlciBkaXN0cm9zPykKClRoaXMgcGF0Y2ggZG9lc24ndCBkZWZpbmUgYSBzZWN1cml0eWZz
IGZpbGUuwqDCoEl0IG11c3QgYmUgYSBzb2Z0IGxpbmsKdG8gdGhlIGFjdHVhbCBmaWxlLgoKPiA+
ID4gdmVyc3VzCj4gPiAKPiA+ID4gL3N5cy9jbGFzcy90cG0vdHBtWC9tYWpvcl92ZXJzaW9uCgpU
aGlzIGlzIGEgc29mdGxpbmsgdG8gdGhlIFRQTSBkZXZpY2UgKGVnLgovc3lzL2RldmljZXMveHh4
eC8uLi4vdHBtL3RwbTApLgoKPiA+IAo+ID4gSXMgaXQgbW9yZSBIVyByZWxhdGVkICgvc3lzL2Ns
YXNzL3RwbS90cG1YKSBvciBMU00gcmVsYXRlZAo+ID4gKC9zeXMva2VybmVsL3NlY3VyaXR5L3Rw
bVgpPwo+ID4gSSBndWVzcyAvc3lzL2tlcm5lbC9zZWN1cml0eS90cG1YIG1pZ2h0IGJlIGJldHRl
ci4KPiAKPiBUaGlzIGlzIHB1cmVseSBhYm91dCB3aGV0aGVyIHRoZSBwaHN5aWNhbCBUUE0gY2hp
cCBpcyAxLjIgb3IgMi4sCj4gcmlnaHQ/ICAvc3lzL2NsYXNzL3RwbS90cG1YIGlzIHdoZXJlIEkg
d291bGQgZXhwZWN0IHRvIGZpbmQgdGhhdC4KPiAKPiA+IFRoYW5rcyBmb3IgaW1wbGVtZW50aW5n
IHRoaXMsIEknbGwgdHJ5IHRvIHRlc3QgaXQgc29vbi4KPiAKPiBZZXMsIGl0J3MgYmVlbiBhIHBh
aW4gcG9pbnQsIGFuZCBzb21lb25lICguLi4sIEkpIHNob3VsZCBoYXZlIGRvbmUgdGhpcyB5ZWFy
cwo+IGFnbyAtIHRoYW5rcyEKCisxCgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xp
c3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
