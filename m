Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id EF045185DA
	for <lists+linux-ltp@lfdr.de>; Thu,  9 May 2019 09:16:19 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B1A5C3EABD1
	for <lists+linux-ltp@lfdr.de>; Thu,  9 May 2019 09:16:19 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 4156D3EABC0
 for <ltp@lists.linux.it>; Thu,  9 May 2019 09:16:17 +0200 (CEST)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 73F962014A3
 for <ltp@lists.linux.it>; Thu,  9 May 2019 09:16:15 +0200 (CEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x497CF25175667
 for <ltp@lists.linux.it>; Thu, 9 May 2019 03:16:14 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2scfjerb4e-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <ltp@lists.linux.it>; Thu, 09 May 2019 03:16:14 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <ltp@lists.linux.it> from <bala24@linux.vnet.ibm.com>;
 Thu, 9 May 2019 08:16:12 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 9 May 2019 08:16:09 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x497G8a452494472
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 9 May 2019 07:16:08 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7A19352054;
 Thu,  9 May 2019 07:16:08 +0000 (GMT)
Received: from dhcp-9-109-247-167.in.ibm.com (unknown [9.124.35.91])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTPS id DA1115204E;
 Thu,  9 May 2019 07:16:07 +0000 (GMT)
Date: Thu, 9 May 2019 12:46:05 +0530
From: Balamuruhan S <bala24@linux.vnet.ibm.com>
To: Li Wang <liwang@redhat.com>
References: <20190508084447.18191-1-liwang@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190508084447.18191-1-liwang@redhat.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-TM-AS-GCONF: 00
x-cbid: 19050907-4275-0000-0000-00000332E77A
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19050907-4276-0000-0000-0000384258B9
Message-Id: <20190509071605.GB6096@dhcp-9-109-247-167.in.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-09_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905090047
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=none autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
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

T24gV2VkLCBNYXkgMDgsIDIwMTkgYXQgMDQ6NDQ6NDZQTSArMDgwMCwgTGkgV2FuZyB3cm90ZToK
PiBOdW1hIHRlc3QgZmFpbGVkIG9uIHN1Y2ggbWFjaGluZSB3aGljaCBoYXMgbm9uLWNvbnRpbnVv
dXMgbnVtYSBub2RlcywKPiBpdCBnZXRzIHdyb25nIGRhdGEgYmVjYXVzZSBvZiB0aGUgYmVsb3cg
c3ludGF4IHJ1bGUgaXMgbm90IGFwcGxpY2FibGUKPiB0byB0aGF0IHNwZWNpYWwgc2l0dWF0aW9u
Lgo+ICAgYCBudW1hc3RhdCAtcCAkcGlkIHxhd2sgJy9eVG90YWwvIHtwcmludCAkJyQoKG5vZGUr
MikpJ30nCj4gSW4gdGhpcyBwYXRjaCwgd2UgZml4IHRoYXQgdmlhIGEgYml0IGNvbXBsZXggd2F5
IG9mIGF3ayB0byBnZXQgdGhlCj4gYWxsb2NhdGVkIG1lbW9yeSBpbiBzcGVjaWZpZWQgbm9kZS4K
PiAKPiAgICMgbnVtYWN0bCAtSAo+ICAgYXZhaWxhYmxlOiAyIG5vZGVzICgwLDgpCj4gICBub2Rl
IDAgY3B1czogMCAxIDIgMyA0IDUgNiA3IDggOSAxMCAxMSAxMiAxMyAxNCAxNSAxNiAxNyAxOAo+
ICAgICAgICAgICAgICAgIDE5IDIwIDIxIDIyIDIzIDI0IDI1IDI2IDI3IDI4IDI5IDMwIDMxIDMy
IDMzIDM0Cj4gICAgICAgICAgICAgICAgMzUgMzYgMzcgMzggMzkgNDAgNDEgNDIgNDMgNDQgNDUg
NDYgNDcgNDggNDkgNTAKPiAgICAgICAgICAgICAgICA1MSA1MiA1MyA1NCA1NSA1NiA1NyA1OCA1
OSA2MCA2MSA2MiA2Mwo+ICAgbm9kZSAwIHNpemU6IDI1Nzc0MSBNQgo+ICAgbm9kZSAwIGZyZWU6
IDI1MzE1OCBNQgo+ICAgbm9kZSA4IGNwdXM6IDY0IDY1IDY2IDY3IDY4IDY5IDcwIDcxIDcyIDcz
IDc0IDc1IDc2IDc3IDc4IDc5Cj4gICAgICAgICAgICAgICAgODAgODEgODIgODMgODQgODUgODYg
ODcgODggODkgOTAgOTEgOTIgOTMgOTQgOTUKPiAgICAgICAgICAgICAgICA5NiA5NyA5OCA5OSAx
MDAgMTAxIDEwMiAxMDMgMTA0IDEwNSAxMDYgMTA3IDEwOAo+ICAgICAgICAgICAgICAgIDEwOSAx
MTAgMTExIDExMiAxMTMgMTE0IDExNSAxMTYgMTE3IDExOCAxMTkgMTIwCj4gICAgICAgICAgICAg
ICAgMTIxIDEyMiAxMjMgMTI0IDEyNSAxMjYgMTI3Cj4gICBub2RlIDggc2l6ZTogMjYxNzUyIE1C
Cj4gICBub2RlIDggZnJlZTogMjQwOTMzIE1CCj4gICBub2RlIGRpc3RhbmNlczoKPiAgIG5vZGUg
ICAwICAgOAo+ICAgICAwOiAgMTAgIDQwCj4gICAgIDg6ICA0MCAgMTAKPiAKPiAgICMgbnVtYXN0
YXQgLXAgJHBpZAo+ICAgUGVyLW5vZGUgcHJvY2VzcyBtZW1vcnkgdXNhZ2UgKGluIE1CcykgZm9y
IFBJRCAzNDE2OCAoc3VwcG9ydF9udW1hKQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
Tm9kZSAwICAgICAgICAgIE5vZGUgOCAgICAgICAgICAgVG90YWwKPiAgICAgICAgICAgICAgICAg
ICAgIC0tLS0tLS0tLS0tLS0tLSAtLS0tLS0tLS0tLS0tLS0gLS0tLS0tLS0tLS0tLS0tCj4gICBI
dWdlICAgICAgICAgICAgICAgICAgICAgICAgIDAuMDAgICAgICAgICAgICAwLjAwICAgICAgICAg
ICAgMC4wMAo+ICAgSGVhcCAgICAgICAgICAgICAgICAgICAgICAgICAwLjAwICAgICAgICAgICAg
MC4xMiAgICAgICAgICAgIDAuMTIKPiAgIFN0YWNrICAgICAgICAgICAgICAgICAgICAgICAgMC4w
MCAgICAgICAgICAgIDAuMDYgICAgICAgICAgICAwLjA2Cj4gICBQcml2YXRlICAgICAgICAgICAg
ICAgICAgICAgIDEuNjIgICAgICAgICAgICAxLjUwICAgICAgICAgICAgMy4xMgo+ICAgLS0tLS0t
LS0tLS0tLS0tLSAgLS0tLS0tLS0tLS0tLS0tIC0tLS0tLS0tLS0tLS0tLSAtLS0tLS0tLS0tLS0t
LS0KPiAgIFRvdGFsICAgICAgICAgICAgICAgICAgICAgICAgMS42MiAgICAgICAgICAgIDEuNjkg
ICAgICAgICAgICAzLjMxCj4gCj4gU2lnbmVkLW9mZi1ieTogTGkgV2FuZyA8bGl3YW5nQHJlZGhh
dC5jb20+Cj4gQ2M6IENodW55dSBIdSA8Y2h1aHVAcmVkaGF0LmNvbT4KPiBDYzogQ3lyaWwgSHJ1
YmlzIDxjaHJ1YmlzQHN1c2UuY3o+Cj4gLS0tCj4gIHRlc3RjYXNlcy9rZXJuZWwvbnVtYS9udW1h
MDEuc2ggfCAyNiArKysrKysrKysrKysrKysrKysrKysrLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwg
MjIgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvdGVzdGNh
c2VzL2tlcm5lbC9udW1hL251bWEwMS5zaCBiL3Rlc3RjYXNlcy9rZXJuZWwvbnVtYS9udW1hMDEu
c2gKPiBpbmRleCAzMzM5M2FjOGQuLjdmM2RlZTg0OSAxMDA3NTUKPiAtLS0gYS90ZXN0Y2FzZXMv
a2VybmVsL251bWEvbnVtYTAxLnNoCj4gKysrIGIvdGVzdGNhc2VzL2tlcm5lbC9udW1hL251bWEw
MS5zaAo+IEBAIC01Miw5ICs1MiwxOCBAQCBUU1RfTkVFRFNfQ01EUz0iYXdrIGJjIG51bWFjdGwg
bnVtYXN0YXQiCj4gIGV4dHJhY3RfbnVtYXN0YXRfcCgpCj4gIHsKPiAgCWxvY2FsIHBpZD0kMQo+
IC0JbG9jYWwgbm9kZT0kKCgkMiArIDIpKQo+IC0KPiAtCWVjaG8gJChudW1hc3RhdCAtcCAkcGlk
IHxhd2sgJy9eVG90YWwvIHtwcmludCAkJyRub2RlJ30nKQo+ICsJbG9jYWwgbm9kZT0kMgo+ICsK
PiArCWVjaG8gJChudW1hc3RhdCAtcCAkcGlkIHwJCVwKPiArCQlhd2sgLXYgbm9kZT0kbm9kZSAn
L05vZGUvIHsJXAo+ICsJCWdzdWIoIk5vZGUiLCAiIik7CQlcCj4gKwkJZm9yIChpPTA7IGk8TkY7
IGkrKykJCVwKPiArCQkJaWYgKCRpID09IG5vZGUpCQlcCj4gKwkJCQljb2w9aSsxOwlcCj4gKwkJ
CW5leHQJCQlcCj4gKwkJfQkJCQlcCj4gKwkJL15Ub3RhbC8ge3ByaW50ICRjb2x9JwkJXAo+ICsJ
KQo+ICB9CgpJZiB3ZSBjYW4gdXNlIGV4dHJhY3RfbnVtYXN0YXRfcDAgd2l0aCBub2RlX2luZGV4
IHRoZW4gdGhlIGV4aXN0aW5nIGNvZGUKd29ya3MsIGZvciBleGFtcGxlIGlmIGNhbiBpbmRleCB3
aGlsZSBpdGVyYXRpbmcgJG5vZGVfbGlzdCBhbmQgdXNlIHRoaXMKd2l0aCBleHRyYWN0X251bWFz
dGF0X3AwIHRoZW4gaXQgc2hvdWxkIHdvcmsuCgpUaGlzIGlzIGp1c3QgbXkgdGhvdWdodHMsIHBs
ZWFzZSBmZWVsIGZyZWUgdG8gY29ycmVjdCBtZSBpZiBJIG1pc3Mgb3IKaXQgaXMgc29tZXRoaW5n
IHdyb25nLiBUaGFua3MhCgotLSBCYWxhCj4gIAo+ICBjaGVja19mb3Jfc3VwcG9ydF9udW1hKCkK
PiBAQCAtMzYzLDcgKzM3MiwxNiBAQCB0ZXN0OSgpCj4gIAkJcGlkPSQhCj4gIAkJVFNUX1JFVFJZ
X0ZVTkMgImNoZWNrX2Zvcl9zdXBwb3J0X251bWEgJHBpZCIgMAo+ICAKPiAtCQlNZW1faHVnZT0k
KGVjaG8gJChudW1hc3RhdCAtcCAkcGlkIHxhd2sgJy9eSHVnZS8ge3ByaW50ICQnJCgobm9kZSsy
KSknfScpKQo+ICsJCU1lbV9odWdlPSQoZWNobyAkKG51bWFzdGF0IC1wICRwaWQgfAlcCj4gKwkJ
CWF3ayAtdiBub2RlPSRub2RlICcvTm9kZS8gewlcCj4gKwkJCWdzdWIoIk5vZGUiLCAiIik7CQlc
Cj4gKwkJCWZvciAoaT0wOyBpPE5GOyBpKyspCQlcCj4gKwkJCQlpZiAoJGkgPT0gbm9kZSkJCVwK
PiArCQkJCQljb2w9aSsxOwlcCj4gKwkJCQluZXh0CQkJXAo+ICsJCQl9CQkJCVwKPiArCQkJL15I
dWdlLyB7cHJpbnQgJGNvbH0nKQkJXAo+ICsJCSkKPiAgCQlNZW1faHVnZT0kKCgke01lbV9odWdl
JS4qfSAqIDEwMjQpKQo+ICAKPiAgCQlpZiBbICIkTWVtX2h1Z2UiIC1sdCAiJEhQQUdFX1NJWkUi
IF07IHRoZW4KPiAtLSAKPiAyLjIwLjEKPiAKPiAKPiAtLSAKPiBNYWlsaW5nIGxpc3QgaW5mbzog
aHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAKCgotLSAKTWFpbGluZyBsaXN0IGlu
Zm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
