Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B44E1879B
	for <lists+linux-ltp@lfdr.de>; Thu,  9 May 2019 11:19:30 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E72893EABD1
	for <lists+linux-ltp@lfdr.de>; Thu,  9 May 2019 11:19:29 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id E2FA23EABBF
 for <ltp@lists.linux.it>; Thu,  9 May 2019 11:19:27 +0200 (CEST)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 7993D60134C
 for <ltp@lists.linux.it>; Thu,  9 May 2019 11:19:25 +0200 (CEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4992x55112122
 for <ltp@lists.linux.it>; Thu, 9 May 2019 05:19:23 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2scgtw1vtj-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <ltp@lists.linux.it>; Thu, 09 May 2019 05:19:23 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <ltp@lists.linux.it> from <bala24@linux.vnet.ibm.com>;
 Thu, 9 May 2019 10:19:21 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 9 May 2019 10:19:19 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x499JIcg35782748
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 9 May 2019 09:19:18 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F15A5A4055;
 Thu,  9 May 2019 09:19:17 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5FD84A405D;
 Thu,  9 May 2019 09:19:17 +0000 (GMT)
Received: from dhcp-9-109-247-167.in.ibm.com (unknown [9.124.35.91])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Thu,  9 May 2019 09:19:17 +0000 (GMT)
Date: Thu, 9 May 2019 14:49:11 +0530
From: Balamuruhan S <bala24@linux.vnet.ibm.com>
To: Li Wang <liwang@redhat.com>
References: <20190508084447.18191-1-liwang@redhat.com>
 <20190509071605.GB6096@dhcp-9-109-247-167.in.ibm.com>
 <CAEemH2e=9eRgj_1H50dY_=fEsL3vsZbxexxUceJhW24ebsQ1Kg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2e=9eRgj_1H50dY_=fEsL3vsZbxexxUceJhW24ebsQ1Kg@mail.gmail.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-TM-AS-GCONF: 00
x-cbid: 19050909-0012-0000-0000-00000319DD63
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19050909-0013-0000-0000-0000215262C9
Message-Id: <20190509091911.GA8751@dhcp-9-109-247-167.in.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-09_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905090057
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=none autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH v2 1/2] numa: fix numa test error with
 non-continuous nodes
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

T24gVGh1LCBNYXkgMDksIDIwMTkgYXQgMDM6NTQ6MTVQTSArMDgwMCwgTGkgV2FuZyB3cm90ZToK
PiBPbiBUaHUsIE1heSA5LCAyMDE5IGF0IDM6MTYgUE0gQmFsYW11cnVoYW4gUyA8YmFsYTI0QGxp
bnV4LnZuZXQuaWJtLmNvbT4KPiB3cm90ZToKPiAKPiA+IE9uIFdlZCwgTWF5IDA4LCAyMDE5IGF0
IDA0OjQ0OjQ2UE0gKzA4MDAsIExpIFdhbmcgd3JvdGU6Cj4gPiA+IE51bWEgdGVzdCBmYWlsZWQg
b24gc3VjaCBtYWNoaW5lIHdoaWNoIGhhcyBub24tY29udGludW91cyBudW1hIG5vZGVzLAo+ID4g
PiBpdCBnZXRzIHdyb25nIGRhdGEgYmVjYXVzZSBvZiB0aGUgYmVsb3cgc3ludGF4IHJ1bGUgaXMg
bm90IGFwcGxpY2FibGUKPiA+ID4gdG8gdGhhdCBzcGVjaWFsIHNpdHVhdGlvbi4KPiA+ID4gICBg
IG51bWFzdGF0IC1wICRwaWQgfGF3ayAnL15Ub3RhbC8ge3ByaW50ICQnJCgobm9kZSsyKSknfScK
PiA+ID4gSW4gdGhpcyBwYXRjaCwgd2UgZml4IHRoYXQgdmlhIGEgYml0IGNvbXBsZXggd2F5IG9m
IGF3ayB0byBnZXQgdGhlCj4gPiA+IGFsbG9jYXRlZCBtZW1vcnkgaW4gc3BlY2lmaWVkIG5vZGUu
Cj4gPiA+Cj4gPiA+ICAgIyBudW1hY3RsIC1ICj4gPiA+ICAgYXZhaWxhYmxlOiAyIG5vZGVzICgw
LDgpCj4gPiA+ICAgbm9kZSAwIGNwdXM6IDAgMSAyIDMgNCA1IDYgNyA4IDkgMTAgMTEgMTIgMTMg
MTQgMTUgMTYgMTcgMTgKPiA+ID4gICAgICAgICAgICAgICAgMTkgMjAgMjEgMjIgMjMgMjQgMjUg
MjYgMjcgMjggMjkgMzAgMzEgMzIgMzMgMzQKPiA+ID4gICAgICAgICAgICAgICAgMzUgMzYgMzcg
MzggMzkgNDAgNDEgNDIgNDMgNDQgNDUgNDYgNDcgNDggNDkgNTAKPiA+ID4gICAgICAgICAgICAg
ICAgNTEgNTIgNTMgNTQgNTUgNTYgNTcgNTggNTkgNjAgNjEgNjIgNjMKPiA+ID4gICBub2RlIDAg
c2l6ZTogMjU3NzQxIE1CCj4gPiA+ICAgbm9kZSAwIGZyZWU6IDI1MzE1OCBNQgo+ID4gPiAgIG5v
ZGUgOCBjcHVzOiA2NCA2NSA2NiA2NyA2OCA2OSA3MCA3MSA3MiA3MyA3NCA3NSA3NiA3NyA3OCA3
OQo+ID4gPiAgICAgICAgICAgICAgICA4MCA4MSA4MiA4MyA4NCA4NSA4NiA4NyA4OCA4OSA5MCA5
MSA5MiA5MyA5NCA5NQo+ID4gPiAgICAgICAgICAgICAgICA5NiA5NyA5OCA5OSAxMDAgMTAxIDEw
MiAxMDMgMTA0IDEwNSAxMDYgMTA3IDEwOAo+ID4gPiAgICAgICAgICAgICAgICAxMDkgMTEwIDEx
MSAxMTIgMTEzIDExNCAxMTUgMTE2IDExNyAxMTggMTE5IDEyMAo+ID4gPiAgICAgICAgICAgICAg
ICAxMjEgMTIyIDEyMyAxMjQgMTI1IDEyNiAxMjcKPiA+ID4gICBub2RlIDggc2l6ZTogMjYxNzUy
IE1CCj4gPiA+ICAgbm9kZSA4IGZyZWU6IDI0MDkzMyBNQgo+ID4gPiAgIG5vZGUgZGlzdGFuY2Vz
Ogo+ID4gPiAgIG5vZGUgICAwICAgOAo+ID4gPiAgICAgMDogIDEwICA0MAo+ID4gPiAgICAgODog
IDQwICAxMAo+ID4gPgo+ID4gPiAgICMgbnVtYXN0YXQgLXAgJHBpZAo+ID4gPiAgIFBlci1ub2Rl
IHByb2Nlc3MgbWVtb3J5IHVzYWdlIChpbiBNQnMpIGZvciBQSUQgMzQxNjggKHN1cHBvcnRfbnVt
YSkKPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICBOb2RlIDAgICAgICAgICAgTm9k
ZSA4ICAgICAgICAgICBUb3RhbAo+ID4gPiAgICAgICAgICAgICAgICAgICAgIC0tLS0tLS0tLS0t
LS0tLSAtLS0tLS0tLS0tLS0tLS0gLS0tLS0tLS0tLS0tLS0tCj4gPiA+ICAgSHVnZSAgICAgICAg
ICAgICAgICAgICAgICAgICAwLjAwICAgICAgICAgICAgMC4wMCAgICAgICAgICAgIDAuMDAKPiA+
ID4gICBIZWFwICAgICAgICAgICAgICAgICAgICAgICAgIDAuMDAgICAgICAgICAgICAwLjEyICAg
ICAgICAgICAgMC4xMgo+ID4gPiAgIFN0YWNrICAgICAgICAgICAgICAgICAgICAgICAgMC4wMCAg
ICAgICAgICAgIDAuMDYgICAgICAgICAgICAwLjA2Cj4gPiA+ICAgUHJpdmF0ZSAgICAgICAgICAg
ICAgICAgICAgICAxLjYyICAgICAgICAgICAgMS41MCAgICAgICAgICAgIDMuMTIKPiA+ID4gICAt
LS0tLS0tLS0tLS0tLS0tICAtLS0tLS0tLS0tLS0tLS0gLS0tLS0tLS0tLS0tLS0tIC0tLS0tLS0t
LS0tLS0tLQo+ID4gPiAgIFRvdGFsICAgICAgICAgICAgICAgICAgICAgICAgMS42MiAgICAgICAg
ICAgIDEuNjkgICAgICAgICAgICAzLjMxCj4gPiA+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IExpIFdh
bmcgPGxpd2FuZ0ByZWRoYXQuY29tPgo+ID4gPiBDYzogQ2h1bnl1IEh1IDxjaHVodUByZWRoYXQu
Y29tPgo+ID4gPiBDYzogQ3lyaWwgSHJ1YmlzIDxjaHJ1YmlzQHN1c2UuY3o+Cj4gPiA+IC0tLQo+
ID4gPiAgdGVzdGNhc2VzL2tlcm5lbC9udW1hL251bWEwMS5zaCB8IDI2ICsrKysrKysrKysrKysr
KysrKysrKystLS0tCj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKSwgNCBk
ZWxldGlvbnMoLSkKPiA+ID4KPiA+ID4gZGlmZiAtLWdpdCBhL3Rlc3RjYXNlcy9rZXJuZWwvbnVt
YS9udW1hMDEuc2gKPiA+IGIvdGVzdGNhc2VzL2tlcm5lbC9udW1hL251bWEwMS5zaAo+ID4gPiBp
bmRleCAzMzM5M2FjOGQuLjdmM2RlZTg0OSAxMDA3NTUKPiA+ID4gLS0tIGEvdGVzdGNhc2VzL2tl
cm5lbC9udW1hL251bWEwMS5zaAo+ID4gPiArKysgYi90ZXN0Y2FzZXMva2VybmVsL251bWEvbnVt
YTAxLnNoCj4gPiA+IEBAIC01Miw5ICs1MiwxOCBAQCBUU1RfTkVFRFNfQ01EUz0iYXdrIGJjIG51
bWFjdGwgbnVtYXN0YXQiCj4gPiA+ICBleHRyYWN0X251bWFzdGF0X3AoKQo+ID4gPiAgewo+ID4g
PiAgICAgICBsb2NhbCBwaWQ9JDEKPiA+ID4gLSAgICAgbG9jYWwgbm9kZT0kKCgkMiArIDIpKQo+
ID4gPiAtCj4gPiA+IC0gICAgIGVjaG8gJChudW1hc3RhdCAtcCAkcGlkIHxhd2sgJy9eVG90YWwv
IHtwcmludCAkJyRub2RlJ30nKQo+ID4gPiArICAgICBsb2NhbCBub2RlPSQyCj4gPiA+ICsKPiA+
ID4gKyAgICAgZWNobyAkKG51bWFzdGF0IC1wICRwaWQgfCAgICAgICAgICAgICAgIFwKPiA+ID4g
KyAgICAgICAgICAgICBhd2sgLXYgbm9kZT0kbm9kZSAnL05vZGUvIHsgICAgIFwKPiA+ID4gKyAg
ICAgICAgICAgICBnc3ViKCJOb2RlIiwgIiIpOyAgICAgICAgICAgICAgIFwKPiA+ID4gKyAgICAg
ICAgICAgICBmb3IgKGk9MDsgaTxORjsgaSsrKSAgICAgICAgICAgIFwKPiA+ID4gKyAgICAgICAg
ICAgICAgICAgICAgIGlmICgkaSA9PSBub2RlKSAgICAgICAgIFwKPiA+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgY29sPWkrMTsgICAgICAgIFwKPiA+ID4gKyAgICAgICAgICAgICAg
ICAgICAgIG5leHQgICAgICAgICAgICAgICAgICAgIFwKPiA+ID4gKyAgICAgICAgICAgICB9ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+ID4gKyAgICAgICAgICAgICAvXlRvdGFs
LyB7cHJpbnQgJGNvbH0nICAgICAgICAgIFwKPiA+ID4gKyAgICAgKQo+ID4gPiAgfQo+ID4KPiA+
IElmIHdlIGNhbiB1c2UgZXh0cmFjdF9udW1hc3RhdF9wMCB3aXRoIG5vZGVfaW5kZXggdGhlbiB0
aGUgZXhpc3RpbmcgY29kZQo+ID4gd29ya3MsIGZvciBleGFtcGxlIGlmIGNhbiBpbmRleCB3aGls
ZSBpdGVyYXRpbmcgJG5vZGVfbGlzdCBhbmQgdXNlIHRoaXMKPiA+IHdpdGggZXh0cmFjdF9udW1h
c3RhdF9wMCB0aGVuIGl0IHNob3VsZCB3b3JrLgo+ID4KPiAKPiBIaSBCYWxhLAo+IAo+IFNvcnJ5
LCBJIGRvbid0IGZ1bGx5IHVuZGVyc3RhbmQgd2hhdCdzIHlvdSBtZWFuIGhlcmUgOiguIENvdWxk
IHlvdSBleHBsYWluCj4gc29tZXRoaW5nIG1vcmUgZm9yIHRoaXMgbWV0aG9kPwoKaW5zdGVhZCBv
ZiBjaGFuZ2luZyBgZXh0cmFjdF9udW1hc3RhdF9wMCgpYCBjYW4gZG8gc29tZXRoaW5nIGxpa2Ug
dGhpcyA/CgpkaWZmIC0tZ2l0IGEvdGVzdGNhc2VzL2tlcm5lbC9udW1hL251bWEwMS5zaCBiL3Rl
c3RjYXNlcy9rZXJuZWwvbnVtYS9udW1hMDEuc2gKaW5kZXggMzMzOTNhYzhkLi40N2MxOGVkZDYg
MTAwNzU1Ci0tLSBhL3Rlc3RjYXNlcy9rZXJuZWwvbnVtYS9udW1hMDEuc2gKKysrIGIvdGVzdGNh
c2VzL2tlcm5lbC9udW1hL251bWEwMS5zaApAQCAtOTQsNiArOTQsNyBAQCBzZXR1cCgpCiB0ZXN0
MSgpCiB7CiAgICAgICAgTWVtX2N1cnI9MAorICAgICAgIG5vZGVfaW5kZXg9MAogCiAgICAgICAg
Zm9yIG5vZGUgaW4gJG5vZGVzX2xpc3Q7IGRvCiAgICAgICAgICAgICAgICBudW1hY3RsIC0tY3B1
bm9kZWJpbmQ9JG5vZGUgLS1tZW1iaW5kPSRub2RlIHN1cHBvcnRfbnVtYSBhbGxvY18xTUIgJgpA
QCAtMTAxLDcgKzEwMiw4IEBAIHRlc3QxKCkKIAogICAgICAgICAgICAgICAgVFNUX1JFVFJZX0ZV
TkMgImNoZWNrX2Zvcl9zdXBwb3J0X251bWEgJHBpZCIgMAogCi0gICAgICAgICAgICAgICBNZW1f
Y3Vycj0kKGVjaG8gIiQoZXh0cmFjdF9udW1hc3RhdF9wICRwaWQgJG5vZGUpICogJE1CIiB8YmMp
CisgICAgICAgICAgICAgICBNZW1fY3Vycj0kKGVjaG8gIiQoZXh0cmFjdF9udW1hc3RhdF9wICRw
aWQgJG5vZGVfaW5kZXgpICogJE1CIiB8YmMpCisgICAgICAgICAgICAgICBsZXQgbm9kZV9pbmRl
eCsrCiAgICAgICAgICAgICAgICBpZiBbICQoZWNobyAiJE1lbV9jdXJyIDwgJE1CIiB8IGJjKSAt
ZXEgMSBdOyB0aGVuCiAgICAgICAgICAgICAgICAgICAgICAgIHRzdF9yZXMgVEZBSUwgXAogICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICJOVU1BIG1lbW9yeSBhbGxvY2F0ZWQgaW4gbm9k
ZSRub2RlIGlzIGxlc3MgdGhhbiBleHBlY3RlZCIKCgotLSBCYWxhCgo+IAo+IAo+IAo+ID4KPiA+
IFRoaXMgaXMganVzdCBteSB0aG91Z2h0cywgcGxlYXNlIGZlZWwgZnJlZSB0byBjb3JyZWN0IG1l
IGlmIEkgbWlzcyBvcgo+ID4gaXQgaXMgc29tZXRoaW5nIHdyb25nLiBUaGFua3MhCj4gPgo+ID4g
LS0gQmFsYQo+ID4gPgo+ID4gPiAgY2hlY2tfZm9yX3N1cHBvcnRfbnVtYSgpCj4gPiA+IEBAIC0z
NjMsNyArMzcyLDE2IEBAIHRlc3Q5KCkKPiA+ID4gICAgICAgICAgICAgICBwaWQ9JCEKPiA+ID4g
ICAgICAgICAgICAgICBUU1RfUkVUUllfRlVOQyAiY2hlY2tfZm9yX3N1cHBvcnRfbnVtYSAkcGlk
IiAwCj4gPiA+Cj4gPiA+IC0gICAgICAgICAgICAgTWVtX2h1Z2U9JChlY2hvICQobnVtYXN0YXQg
LXAgJHBpZCB8YXdrICcvXkh1Z2UvIHtwcmludAo+ID4gJCckKChub2RlKzIpKSd9JykpCj4gPiA+
ICsgICAgICAgICAgICAgTWVtX2h1Z2U9JChlY2hvICQobnVtYXN0YXQgLXAgJHBpZCB8ICAgIFwK
PiA+ID4gKyAgICAgICAgICAgICAgICAgICAgIGF3ayAtdiBub2RlPSRub2RlICcvTm9kZS8geyAg
ICAgXAo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgZ3N1YigiTm9kZSIsICIiKTsgICAgICAg
ICAgICAgICBcCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICBmb3IgKGk9MDsgaTxORjsgaSsr
KSAgICAgICAgICAgIFwKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaWYgKCRp
ID09IG5vZGUpICAgICAgICAgXAo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGNvbD1pKzE7ICAgICAgICBcCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIG5leHQgICAgICAgICAgICAgICAgICAgIFwKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAg
IH0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ID4gPiArICAgICAgICAgICAgICAg
ICAgICAgL15IdWdlLyB7cHJpbnQgJGNvbH0nKSAgICAgICAgICBcCj4gPiA+ICsgICAgICAgICAg
ICAgKQo+ID4gPiAgICAgICAgICAgICAgIE1lbV9odWdlPSQoKCR7TWVtX2h1Z2UlLip9ICogMTAy
NCkpCj4gPiA+Cj4gPiA+ICAgICAgICAgICAgICAgaWYgWyAiJE1lbV9odWdlIiAtbHQgIiRIUEFH
RV9TSVpFIiBdOyB0aGVuCj4gPiA+IC0tCj4gPiA+IDIuMjAuMQo+ID4gPgo+ID4gPgo+ID4gPiAt
LQo+ID4gPiBNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5m
by9sdHAKPiA+Cj4gPgo+IAo+IC0tIAo+IFJlZ2FyZHMsCj4gTGkgV2FuZwoKCi0tIApNYWlsaW5n
IGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
