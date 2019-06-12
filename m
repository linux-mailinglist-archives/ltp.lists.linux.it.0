Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C231C42A52
	for <lists+linux-ltp@lfdr.de>; Wed, 12 Jun 2019 17:07:14 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 95E263EAE2B
	for <lists+linux-ltp@lfdr.de>; Wed, 12 Jun 2019 17:07:14 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id BECD23EA6E9
 for <ltp@lists.linux.it>; Wed, 12 Jun 2019 17:07:12 +0200 (CEST)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 23F2E140184A
 for <ltp@lists.linux.it>; Wed, 12 Jun 2019 17:07:10 +0200 (CEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5CF4Ijq109853
 for <ltp@lists.linux.it>; Wed, 12 Jun 2019 11:07:08 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2t33bcsfcx-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <ltp@lists.linux.it>; Wed, 12 Jun 2019 11:07:08 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <ltp@lists.linux.it> from <zohar@linux.ibm.com>;
 Wed, 12 Jun 2019 16:07:06 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 12 Jun 2019 16:07:04 +0100
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5CF73Er52559980
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 Jun 2019 15:07:03 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 38DBE42042;
 Wed, 12 Jun 2019 15:07:03 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5F39F4203F;
 Wed, 12 Jun 2019 15:07:02 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.80.109.218])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 12 Jun 2019 15:07:02 +0000 (GMT)
From: Mimi Zohar <zohar@linux.ibm.com>
To: Petr Vorel <pvorel@suse.cz>, ltp@lists.linux.it
Date: Wed, 12 Jun 2019 11:06:51 -0400
In-Reply-To: <20190611193021.17651-4-pvorel@suse.cz>
References: <20190611193021.17651-1-pvorel@suse.cz>
 <20190611193021.17651-4-pvorel@suse.cz>
X-Mailer: Evolution 3.20.5 (3.20.5-1.fc24) 
Mime-Version: 1.0
X-TM-AS-GCONF: 00
x-cbid: 19061215-0008-0000-0000-000002F327C0
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19061215-0009-0000-0000-000022602A27
Message-Id: <1560352011.4578.43.camel@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-12_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906120101
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Cc: Ignaz Forster <iforster@suse.de>, linux-integrity@vger.kernel.org,
 Mimi Zohar <zohar@linux.vnet.ibm.com>
Subject: Re: [LTP] [PATCH v3 3/4] ima/ima_measurements.sh: Require builtin
 IMA tcb policy
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

SGkgUGV0ciwKCk9uIFR1ZSwgMjAxOS0wNi0xMSBhdCAyMTozMCArMDIwMCwgUGV0ciBWb3JlbCB3
cm90ZToKPiBBbHRob3VnaCBjdXN0b20gcG9saWN5IHdoaWNoIGNvbnRhaW5zIHRjYiBjYW4gYmUg
bG9hZGVkIHZpYSBkcmFjdXQsCgped2hpY2ggbWF5IGNvbnRhaW4gdGhlIGVxdWl2YWxlbnQgbWVh
c3VyZW1lbnQgdGNiIHJ1bGVzCgo+IHN5c3RlbWQgb3IgbGF0ZXIgbWFudWFsbHkgZnJvbSB1c2Vy
IHNwYWNlLCBkZXRlY3RpbmcgaXQgd291bGQgcmVxdWlyZQo+IElNQV9SRUFEX1BPTElDWT15LiBJ
biBvcmRlciB0byBzaW1wbGlmeSB0aGUgY2hlY2sgYW5kIGF2b2lkIGZhbHNlCj4gcG9zaXRpdmVz
IGxldHMgaWdub3JlIHRoaXMgb3B0aW9uIGFuZCByZXF1aXJlIGJ1aWx0aW4gSU1BIHRjYiBwb2xp
Y3kuCgpUaGlzIHRlc3QgaXMgZm9yIGFkZGluZyBuZXcgbWVhc3VyZW1lbnRzIHRvIHRoZSBtZWFz
dXJlbWVudCBsaXN0LgoKPiAKPiBTaWduZWQtb2ZmLWJ5OiBQZXRyIFZvcmVsIDxwdm9yZWxAc3Vz
ZS5jej4KPiAtLS0KPiAgLi4uL2tlcm5lbC9zZWN1cml0eS9pbnRlZ3JpdHkvaW1hL3Rlc3RzL2lt
YV9tZWFzdXJlbWVudHMuc2ggICAgfCAzICsrLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRp
b25zKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3Rlc3RjYXNlcy9rZXJuZWwv
c2VjdXJpdHkvaW50ZWdyaXR5L2ltYS90ZXN0cy9pbWFfbWVhc3VyZW1lbnRzLnNoIGIvdGVzdGNh
c2VzL2tlcm5lbC9zZWN1cml0eS9pbnRlZ3JpdHkvaW1hL3Rlc3RzL2ltYV9tZWFzdXJlbWVudHMu
c2gKPiBpbmRleCAzMjhhZmZjNDMuLmEzYWEyNGQ4YSAxMDA3NTUKPiAtLS0gYS90ZXN0Y2FzZXMv
a2VybmVsL3NlY3VyaXR5L2ludGVncml0eS9pbWEvdGVzdHMvaW1hX21lYXN1cmVtZW50cy5zaAo+
ICsrKyBiL3Rlc3RjYXNlcy9rZXJuZWwvc2VjdXJpdHkvaW50ZWdyaXR5L2ltYS90ZXN0cy9pbWFf
bWVhc3VyZW1lbnRzLnNoCj4gQEAgLTU3LDcgKzU3LDggQEAgc2V0dXAoKQo+ICAJWyAteiAiJERJ
R0VTVF9JTkRFWCIgXSAmJiB0c3RfYnJrIFRDT05GIFwKPiAgCQkiQ2Fubm90IGZpbmQgZGlnZXN0
IGluZGV4ICh0ZW1wbGF0ZTogJyR0ZW1wbGF0ZScpIgo+IAo+IC0JdHN0X3JlcyBUSU5GTyAiSU1B
IG1lYXN1cmVtZW50IHRlc3RzIGFzc3VtZSB0Y2IgcG9saWN5IHRvIGJlIGxvYWRlZCAoaW1hX3Bv
bGljeT10Y2IpIgo+ICsJZ3JlcCAtcSAtZSBpbWFfcG9saWN5PVthLXpfXSp0Y2IgLWUgaW1hX3Rj
YiAtZSBpbWFfYXBwcmFpc2VfdGNiIC9wcm9jL2NtZGxpbmUgfHwgXAo+ICsJCXRzdF9icmsgVENP
TkYgIklNQSBtZWFzdXJlbWVudCB0ZXN0cyByZXF1aXJlIGJ1aWx0aW4gSU1BIHRjYiBwb2xpY3kg
KGltYV9wb2xpY3k9dGNiIG9yIGltYV9wb2xpY3k9YXBwcmFpc2VfdGNiIGtlcm5lbCBwYXJhbWV0
ZXIpIgo+ICB9Cj4gCgoiYXBwcmFpc2VfdGNiIiBkb2Vzbid0IHByb3ZpZGUgdGhlIG5lY2Vzc2Fy
eSBtZWFzdXJlbWVudCBydWxlcy4KImltYV9wb2xpY3k9IiBpc24ndCBvcmRlciBzcGVjaWZpYy4g
wqBUaGUgY2hlY2sgd291bGQgYmUgZm9yICJ8dGNiIiwgInwKdGNiIiwgInRjYnwiLCAidGNiIHwi
LCBvciBqdXN0ICI9dGNiIi4gwqBUaGUgZGVwcmVjYXRlZCAiaW1hX3RjYiIKb3B0aW9uIGlzIGZp
bmUgdG9vLgoKTWltaQoKPiAgIyBUT0RPOiBmaW5kIHN1cHBvcnQgZm9yIHJtZDEyOCBybWQyNTYg
cm1kMzIwIHdwMjU2IHdwMzg0IHRncjEyOCB0Z3IxNjAKCgoKLS0gCk1haWxpbmcgbGlzdCBpbmZv
OiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
