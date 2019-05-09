Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E463187A7
	for <lists+linux-ltp@lfdr.de>; Thu,  9 May 2019 11:24:08 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1432B3EABD2
	for <lists+linux-ltp@lfdr.de>; Thu,  9 May 2019 11:24:08 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 2FC8E3EABC0
 for <ltp@lists.linux.it>; Thu,  9 May 2019 11:24:07 +0200 (CEST)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 79C101A00F8E
 for <ltp@lists.linux.it>; Thu,  9 May 2019 11:24:06 +0200 (CEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x499Ms3U063101
 for <ltp@lists.linux.it>; Thu, 9 May 2019 05:24:04 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2scf4axp1a-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <ltp@lists.linux.it>; Thu, 09 May 2019 05:24:04 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <ltp@lists.linux.it> from <bala24@linux.vnet.ibm.com>;
 Thu, 9 May 2019 10:24:02 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 9 May 2019 10:24:01 +0100
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x499O0Z138404238
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 9 May 2019 09:24:00 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1CA434204D;
 Thu,  9 May 2019 09:24:00 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 827E242049;
 Thu,  9 May 2019 09:23:59 +0000 (GMT)
Received: from dhcp-9-109-247-167.in.ibm.com (unknown [9.124.35.91])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Thu,  9 May 2019 09:23:59 +0000 (GMT)
Date: Thu, 9 May 2019 14:53:54 +0530
From: Balamuruhan S <bala24@linux.vnet.ibm.com>
To: Li Wang <liwang@redhat.com>
References: <20190508084447.18191-1-liwang@redhat.com>
 <20190508084447.18191-2-liwang@redhat.com>
 <20190509064535.GA6096@dhcp-9-109-247-167.in.ibm.com>
 <CAEemH2ei_ORaYzfmfJOiPr0Gb7R2Kt2-WNWGp9fVBSzqGiWeug@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2ei_ORaYzfmfJOiPr0Gb7R2Kt2-WNWGp9fVBSzqGiWeug@mail.gmail.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-TM-AS-GCONF: 00
x-cbid: 19050909-0016-0000-0000-00000279E046
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19050909-0017-0000-0000-000032D693C2
Message-Id: <20190509092354.GB8751@dhcp-9-109-247-167.in.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-09_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=3 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905090058
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=none autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH v2 2/2] libltpnuma: remove restrictions on numa
 node-id
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.18
Precedence: list
List-Id: Linux Test Project <ltp.lists.linux.it>
List-Unsubscribe: <https://lists.linux.it/options/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=unsubscribe>
List-Archive: <http://lists.linux.it/pipermail/ltp/>
List-Post: <mailto:ltp@lists.linux.it>
List-Help: <mailto:ltp-request@lists.linux.it?subject=help>
List-Subscribe: <https://lists.linux.it/listinfo/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

T24gVGh1LCBNYXkgMDksIDIwMTkgYXQgMDQ6MDA6NDBQTSArMDgwMCwgTGkgV2FuZyB3cm90ZToK
PiBPbiBUaHUsIE1heSA5LCAyMDE5IGF0IDI6NDUgUE0gQmFsYW11cnVoYW4gUyA8YmFsYTI0QGxp
bnV4LnZuZXQuaWJtLmNvbT4KPiB3cm90ZToKPiAKPiA+IE9uIFdlZCwgTWF5IDA4LCAyMDE5IGF0
IDA0OjQ0OjQ3UE0gKzA4MDAsIExpIFdhbmcgd3JvdGU6Cj4gPiA+IEZvciBzb21lIHBwYzY0bGUg
c3lzdGVtcywgaXQgaGFzIG5vbi1jb250aW51b3VzIG51bWEgbm9kZXMgaW4KPiA+ID4gaGFyZHdh
cmUgY29uZmlndXJhdGlvbi4gU28gd2UncmUgaGl0dGluZyB0aGUgYmVsb3cgd2FybmluZ3Mgd2hp
bGUKPiA+ID4gcnVubmluZyBzZXRfbWVtcG9saWN5IHRlc3RzIG9uIHRoYXQuIFRvIGZpeCB0aGlz
IGlzc3VlLCBsZXQncyBqdXN0Cj4gPiA+IHJlbW92ZSByZXN0cmljdGlvbnMgb24gbnVtYSBub2Rl
LWlkIGluIGdldF9tZW1wb2xpY3koKS4KPiA+ID4KPiA+ID4gRXJyb3IgTG9nCj4gPiA+IC0tLS0t
LS0tLQo+ID4gPiB0c3RfdGVzdC5jOjEwOTY6IElORk86IFRpbWVvdXQgcGVyIHJ1biBpcyAwaCA1
MG0gMDBzCj4gPiA+IHRzdF9udW1hLmM6MTkwOiBJTkZPOiBGb3VuZCAyIE5VTUEgbWVtb3J5IG5v
ZGVzCj4gPiA+IHNldF9tZW1wb2xpY3kwMS5jOjYzOiBQQVNTOiBzZXRfbWVtcG9saWN5KE1QT0xf
QklORCkgbm9kZSAwCj4gPiA+IHRzdF9udW1hLmM6MjY6IElORk86IE5vZGUgMCBhbGxvY2F0ZWQg
MTYgcGFnZXMKPiA+ID4gdHN0X251bWEuYzoyNjogSU5GTzogTm9kZSA4IGFsbG9jYXRlZCAwIHBh
Z2VzCj4gPiA+IHNldF9tZW1wb2xpY3kwMS5jOjgyOiBQQVNTOiBjaGlsZDogTm9kZSAwIGFsbG9j
YXRlZCAxNgo+ID4gPiBzZXRfbWVtcG9saWN5MDEuYzo2MzogUEFTUzogc2V0X21lbXBvbGljeShN
UE9MX0JJTkQpIG5vZGUgOAo+ID4gPiB0c3RfbnVtYS5jOjkyOiBXQVJOOiBnZXRfbWVtcG9saWN5
KC4uLikgcmV0dXJuZWQgaW52YWxpZCBub2RlIDgKPiA+ID4gdHN0X251bWEuYzo5MjogV0FSTjog
Z2V0X21lbXBvbGljeSguLi4pIHJldHVybmVkIGludmFsaWQgbm9kZSA4Cj4gPiA+IHRzdF9udW1h
LmM6OTI6IFdBUk46IGdldF9tZW1wb2xpY3koLi4uKSByZXR1cm5lZCBpbnZhbGlkIG5vZGUgOAo+
ID4gPiAuLi4KPiA+ID4gdHN0X251bWEuYzoyNjogSU5GTzogTm9kZSAwIGFsbG9jYXRlZCAwIHBh
Z2VzCj4gPiA+IHRzdF9udW1hLmM6MjY6IElORk86IE5vZGUgOCBhbGxvY2F0ZWQgMCBwYWdlcwo+
ID4gPiBzZXRfbWVtcG9saWN5MDEuYzo4NjogRkFJTDogY2hpbGQ6IE5vZGUgOCBhbGxvY2F0ZWQg
MCwgZXhwZWN0ZWQgMTYKPiA+ID4KPiA+ID4gbHNjcHUKPiA+ID4gLS0tLS0KPiA+ID4gQXJjaGl0
ZWN0dXJlOiAgICAgICAgcHBjNjRsZQo+ID4gPiAuLi4KPiA+ID4gQ1BVKHMpOiAgICAgICAgICAg
ICAgMTI4Cj4gPiA+IENvcmUocykgcGVyIHNvY2tldDogIDE2Cj4gPiA+IFNvY2tldChzKTogICAg
ICAgICAgIDIKPiA+ID4gTlVNQSBub2RlKHMpOiAgICAgICAgMgo+ID4gPiBNb2RlbCBuYW1lOiAg
ICAgICAgICBQT1dFUjksIGFsdGl2ZWMgc3VwcG9ydGVkCj4gPiA+IC4uLgo+ID4gPiBOVU1BIG5v
ZGUwIENQVShzKTogICAwLTYzCj4gPiA+IE5VTUEgbm9kZTggQ1BVKHMpOiAgIDY0LTEyNwo+ID4g
Pgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBMaSBXYW5nIDxsaXdhbmdAcmVkaGF0LmNvbT4KPiA+ID4g
Q2M6IEN5cmlsIEhydWJpcyA8Y2hydWJpc0BzdXNlLmN6Pgo+ID4gPiAtLS0KPiA+ID4gIGxpYnMv
bGlibHRwbnVtYS90c3RfbnVtYS5jIHwgNSArKystLQo+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDMg
aW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiA+ID4KPiA+ID4gZGlmZiAtLWdpdCBhL2xp
YnMvbGlibHRwbnVtYS90c3RfbnVtYS5jIGIvbGlicy9saWJsdHBudW1hL3RzdF9udW1hLmMKPiA+
ID4gaW5kZXggMGJhNmRhZjM5Li41NmM4NjQwZmYgMTAwNjQ0Cj4gPiA+IC0tLSBhL2xpYnMvbGli
bHRwbnVtYS90c3RfbnVtYS5jCj4gPiA+ICsrKyBiL2xpYnMvbGlibHRwbnVtYS90c3RfbnVtYS5j
Cj4gPiA+IEBAIC04OCw4ICs4OCw5IEBAIHZvaWQgdHN0X25vZGVtYXBfY291bnRfcGFnZXMoc3Ry
dWN0IHRzdF9ub2RlbWFwICpub2RlcywKPiA+ID4gICAgICAgICAgICAgICBpZiAocmV0IDwgMCkK
PiA+ID4gICAgICAgICAgICAgICAgICAgICAgIHRzdF9icmsoVEJST0sgfCBURVJSTk8sICJnZXRf
bWVtcG9saWN5KCkgZmFpbGVkIik7Cj4gPiA+Cj4gPiA+IC0gICAgICAgICAgICAgaWYgKG5vZGUg
PCAwIHx8ICh1bnNpZ25lZCBpbnQpbm9kZSA+PSBub2Rlcy0+Y250KSB7Cj4gPiA+IC0gICAgICAg
ICAgICAgICAgICAgICB0c3RfcmVzKFRXQVJOLCAiZ2V0X21lbXBvbGljeSguLi4pIHJldHVybmVk
Cj4gPiBpbnZhbGlkIG5vZGUgJWlcbiIsIG5vZGUpOwo+ID4gPiArICAgICAgICAgICAgIGlmIChu
b2RlIDwgMCkgewo+ID4KPiA+IEl0IGlzIGJldHRlciB0byBoYXZlIGNoZWNrIGZvciBwb3dlcnBj
IGFuZCByZW1vdmUgcmVzdHJpY3Rpb24gYXMgaXQgd2lsbAo+ID4gc3RpbGwgaG9sZCBnb29kIGZv
ciBvdGhlciBhcmNoLgo+ID4KPiAKPiBJZiB0aGUgbm9uLWNvbnRpbnVvdXMgbnVtYSBub2RlcyBv
bmx5IGFwcGVhciBpbiBwcGMgbWFjaGluZSwgdGhhdCBzaG91bGQgYmUKPiBuZWNlc3NhcnkgdG8g
Y2hlY2sgYXJjaCBiZWZvcmUgcmVtb3ZpbmcgdGhlIHJlc3RyaWN0aW9uLgo+IAo+IHRoZW4gdGhl
IHBhdGNoIHByb2JhYmx5IGxpa2U6Cj4gCj4gLS0tIGEvbGlicy9saWJsdHBudW1hL3RzdF9udW1h
LmMKPiArKysgYi9saWJzL2xpYmx0cG51bWEvdHN0X251bWEuYwo+IEBAIC04OCw3ICs4OCwxMSBA
QCB2b2lkIHRzdF9ub2RlbWFwX2NvdW50X3BhZ2VzKHN0cnVjdCB0c3Rfbm9kZW1hcCAqbm9kZXMs
Cj4gICAgICAgICAgICAgICAgIGlmIChyZXQgPCAwKQo+ICAgICAgICAgICAgICAgICAgICAgICAg
IHRzdF9icmsoVEJST0sgfCBURVJSTk8sICJnZXRfbWVtcG9saWN5KCkgZmFpbGVkIik7Cj4gCj4g
KyNpZiBkZWZpbmVkIChfX3Bvd2VycGM2NF9fKSB8fCAoX19wb3dlcnBjX18pCj4gKyAgICAgICAg
ICAgICAgIGlmIChub2RlIDwgMCkgewo+ICsjZWxpZgo+ICAgICAgICAgICAgICAgICBpZiAobm9k
ZSA8IDAgfHwgKHVuc2lnbmVkIGludClub2RlID49IG5vZGVzLT5jbnQpIHsKPiArI2VuZGlmCgpM
b29rcyBnb29kIHRvIG1lLiBUaGFua3MhCgotLSBCYWxhCj4gICAgICAgICAgICAgICAgICAgICAg
ICAgdHN0X3JlcyhUV0FSTiwgImdldF9tZW1wb2xpY3koLi4uKSByZXR1cm5lZCBpbnZhbGlkCj4g
bm9kZSAlaVxuIiwgbm9kZSk7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgY29udGludWU7Cj4g
ICAgICAgICAgICAgICAgIH0KPiAKPiAKPiAtLSAKPiBSZWdhcmRzLAo+IExpIFdhbmcKCgotLSAK
TWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
