Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C99DD1FA159
	for <lists+linux-ltp@lfdr.de>; Mon, 15 Jun 2020 22:21:46 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 864F83C2D78
	for <lists+linux-ltp@lfdr.de>; Mon, 15 Jun 2020 22:21:46 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id E7EAE3C00A6
 for <ltp@lists.linux.it>; Mon, 15 Jun 2020 22:21:44 +0200 (CEST)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 724CF1234611
 for <ltp@lists.linux.it>; Mon, 15 Jun 2020 22:21:42 +0200 (CEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05FK3avK129600; Mon, 15 Jun 2020 16:21:38 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31pc7mxx7b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Jun 2020 16:21:38 -0400
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 05FK4IeV133316;
 Mon, 15 Jun 2020 16:21:38 -0400
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31pc7mxx6p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Jun 2020 16:21:37 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05FKL4oH030697;
 Mon, 15 Jun 2020 20:21:35 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03fra.de.ibm.com with ESMTP id 31mpe7spaq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Jun 2020 20:21:35 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05FKLXRK65470676
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 15 Jun 2020 20:21:33 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6B37E11C050;
 Mon, 15 Jun 2020 20:21:33 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5911D11C052;
 Mon, 15 Jun 2020 20:21:32 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.85.184.11])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 15 Jun 2020 20:21:32 +0000 (GMT)
Message-ID: <1592252491.11061.181.camel@linux.ibm.com>
From: Mimi Zohar <zohar@linux.ibm.com>
To: Bruno Meneguele <bmeneg@redhat.com>, Petr Vorel <pvorel@suse.cz>
Date: Mon, 15 Jun 2020 16:21:31 -0400
In-Reply-To: <20200615194134.GF129694@glitch>
References: <20200527071434.28574-1-pvorel@suse.cz>
 <1590601280.16219.1.camel@linux.ibm.com> <20200528140747.GA8401@dell5510>
 <1590679145.4457.39.camel@linux.ibm.com> <20200528160527.GA27243@dell5510>
 <20200615194134.GF129694@glitch>
X-Mailer: Evolution 3.20.5 (3.20.5-1.fc24) 
Mime-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-15_03:2020-06-15,
 2020-06-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 mlxlogscore=999 clxscore=1015 impostorscore=0 malwarescore=0
 cotscore=-2147483648 priorityscore=1501 lowpriorityscore=0 phishscore=0
 spamscore=0 mlxscore=0 adultscore=0 bulkscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006150111
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
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

T24gTW9uLCAyMDIwLTA2LTE1IGF0IDE2OjQxIC0wMzAwLCBCcnVubyBNZW5lZ3VlbGUgd3JvdGU6
Cj4gT24gVGh1LCBNYXkgMjgsIDIwMjAgYXQgMDY6MDU6MjdQTSArMDIwMCwgUGV0ciBWb3JlbCB3
cm90ZToKPiA+IEhpIE1pbWksCj4gPiAuLi4KPiA+ID4gPiA+IFdpdGgganVzdCB0aGlzIGNoYW5n
ZSwgdGhlIGltYV90cG0uc2ggdGVzdCBpcyBmYWlsaW5nLiDCoEkgYXNzdW1lIGl0IGlzCj4gPiA+
ID4gPiBmYWlsaW5nIGJlY2F1c2UgaXQgaXMgcmVhZGluZyB0aGUgU0hBMSBUUE0gYmFuaywgbm90
IHRoZSBTSEEyNTYgYmFuawo+ID4gPiA+ID4gdG8gY2FsY3VsYXRlIHRoZSBib290X2FnZ3JlZ2F0
ZSBoYXNoLgo+ID4gPiA+IEZpcnN0IHF1ZXN0aW9uOiBpcyBpdCBjb3JyZWN0IHRvIHRha2Ugc2hh
MjU2PyBCZWNhdXNlIG9uIG15IHRlc3QgYmVsb3cgaXQncwo+ID4gPiA+IHJlYWRpbmcgc2hhMSwg
YmVjYXVzZSB0aGF0J3MgdGhlIGNvbnRlbnQgb2YgL3N5cy9rZXJuZWwvc2VjdXJpdHkvaW1hL2Fz
Y2lpX3J1bnRpbWVfbWVhc3VyZW1lbnRzCj4gPiAKPiA+ID4gPiBJIHRob3VnaHQganVzdCBrZXJu
ZWwgY29tbWl0OiA2ZjFhMWQxMDNiNDggaW1hOiAoIlN3aXRjaCB0byBpbWFfaGFzaF9hbGdvIGZv
cgo+ID4gPiA+IGJvb3QgYWdncmVnYXRlIikgZnJvbSBjdXJyZW50IGxpbnV4LWludGVncml0eSB0
cmVlIGlzIG5lZWRlZCwgYnV0IEkgdGVzdGVkIGl0IG9uCj4gPiA+ID4gYjU5ZmRhNDQ5Y2YwICgi
aW1hOiBTZXQgYWdhaW4gYnVpbGRfaW1hX2FwcHJhaXNlIHZhcmlhYmxlIikgKGkuZS4gaGF2aW5n
IGFsbAo+ID4gPiA+IFJvYmV0bydzIGltYSBwYXRjaGVzLCAgbWlzc2luZyBqdXN0IGxhc3QgMiBj
b21taXRzIGZyb20gbmV4dC1pbnRlZ3JpdHkgaGVhZCkuCj4gPiA+ID4gV2hhdCBpcyBuZWVkZWQg
dG8gZ2V0IHlvdXIgc2V0dXA/Cj4gPiAKPiA+ID4gVGhpcyBpc24ndCBhIGNvbmZpZ3VyYXRpb24g
cHJvYmxlbSwgYnV0IGFuIGlzc3VlIG9mIHJlYWRpbmcgUENScyBhbmQKPiA+ID4gY2FsY3VsYXRp
bmcgdGhlIFRQTSBiYW5rIGFwcHJvcHJpYXRlIGJvb3RfYWdncmVnYXRlLiDCoElmIHlvdSdyZQo+
ID4gPiBjYWxjdWxhdGluZyBhIHNoYTI1NiBib290X2FnZ3JlZ2F0ZSwgdGhlbiB0aGUgdGVzdCBu
ZWVkcyB0byByZWFkIGFuZAo+ID4gPiBjYWxjdWxhdGUgdGhlIGJvb3RfYWdncmVnYXRlIGJ5IHJl
YWRpbmcgdGhlIFNIQTI1NiBUUE0gYmFuay4KPiA+IE9LLCBJIHRlc3RlZCBpdCBvbiBUUE0gMS4y
IChubyBUUE0gMi4wIGF2YWlsYWJsZSBhdG0pLgo+ID4gSSBndWVzcyB5b3UgaGF2ZSBUUE0gMi4w
LCB0aGF0J3Mgd2h5IEkgZGlkbid0IHNwb3QgdGhpcyBpc3N1ZS4KPiA+IAo+ID4gVG8gc3VtIHRo
YXQ6IG15IHBhdGNoIGlzIHJlcXVpcmVkIGZvciBhbnkgc3lzdGVtIHdpdGhvdXQgcGh5c2ljYWwg
VFBNIHdpdGggd2l0aAo+ID4ga2VybmVsIHdpdGggYjU5ZmRhNDQ5Y2YwICsgaXQgYWxzbyB3b3Jr
cyBmb3IgVFBNIDEuMiAocmVnYXJkbGVzcyBrZXJuZWwKPiA+IHZlcnNpb24pLCBiZWNhdXNlIFRQ
TSAxLjIgc3VwcG9ydHMgc2hhMSBvbmx5IGJvb3QgYWdncmVnYXRlLgo+ID4gCj4gPiBCdXQgdGVz
dGluZyBvbiBrZXJuZWwgd2l0aCBiNTlmZGE0NDljZjAgd2l0aCBUUE0gMi4wIGlzIG5vdCBvbmx5
IGJyb2tlbiB3aXRoCj4gPiB0aGlzIHBhdGNoLCBidXQgYWxzbyBvbiBjdXJyZW50IHZlcnNpb24g
aW4gbWFzdGVyLCByaWdodD8gQXMgeW91IGhhdmUKPiA+IHNoYTI1NjozZmQ1ZGM3MTdmODg2ZmY3
MTgyNTI2ZWZjNWVkYzNhYmIxNzlhNWFhYzFhYjU4OWM4ZWM4ODgzOTgyMzNhZTUgYW55d2F5Lgo+
ID4gU28gdGhpcyBwYXRjaCB3b3VsZCBoZWxwIGF0IGxlYXN0IHRlc3Rpbmcgb24gVk0gd2l0aG91
dCB2VFBNLgo+ID4gCj4gCj4gSWYgd2UgY29uc2lkZXIgdG8gZGVsYXkgdGhpcyBjaGFuZ2UgdW50
aWwgd2UgaGF2ZSB0aGUgaW1hLWV2bS11dGlscwo+IHJlbGVhc2VkIHdpdGggdGhlIGltYV9ib290
X2FnZ3JlZ2F0ZSArIG1ha2UgdGhpcyB0ZXN0IGRlcGVuZGVudCBvbgo+IGJvdGggaW1hLWV2bS11
dGlscyBhbmQgdHNzcGNycmVhZCwgd291bGQgaXQgYmUgd29ydGggdG8gU0tJUCB0aGUgdGVzdCBp
bgo+IGNhc2UgYSBUUE0yLjAgc2hhMjU2IGJhbmsgaXMgZGV0ZWN0ZWQgaW5zdGVhZCBvZiBGQUlM
PyBUaHVzIHdlIGNvdWxkCj4gaGF2ZSB0aGUgdGVzdCBmaXhlZCBmb3IgVFBNMS4yICYmIG5vLVRQ
TSBjYXNlcyB1bnRpbCB3ZSBnZXQgdGhlIGZ1bGwKPiBzdXBwb3J0IGZvciBtdWx0aXBsZSBiYW5r
cz8KCkFzIGxvbmcgYXMgd2UncmUgZGVhbGluZyB3aXRoIHRoZSAiYm9vdF9hZ2dyZWdhdGUiLCBN
YXVyaXppbyBqdXN0CnBvc3RlZCBhIGtlcm5lbCBwYXRjaCBmb3IgaW5jbHVkaW5nIFBDUiA4ICYg
OSBpbiB0aGUgYm9vdF9hZ2dyZWdhdGUuCsKgVGhlIGV4aXN0aW5nIElNQSBMVFAgImJvb3RfYWdn
cmVnYXRlIiB0ZXN0IGlzIGdvaW5nIHRvIG5lZWQgdG8Kc3VwcG9ydCB0aGlzIGNoYW5nZS4KCkkn
ZCBhcHByZWNpYXRlIGlmIHNvbWVvbmUgY291bGQgc2VuZCBtZSBhIFRQTSBldmVudCBsb2csIHRo
ZSBQQ1JzLCBhbmQKdGhlIGFzc29jaWF0ZWQgSU1BIGFzY2lpX3J1bnRpbWVfbWVhc3VyZW1lbnRz
ICJib290X2FnZ3JlZ2F0ZSIgZnJvbSBhCnN5c3RlbSB3aXRoIGEgZGlzY3JldGUgVFBNIDIuMCB3
aXRoIFBDUnMgOCAmIDkgZXZlbnRzLgoKPiAKPiA+IC4uLgo+ID4gPiA+ID4gVGhlIGltYS1ldm0t
dXRpbHMgbmV4dC10ZXN0aW5nIGJyYW5jaCBoYXMgY29kZSB0byBjYWxjdWxhdGUgdGhlCj4gPiA+
ID4gPiBib290X2FnZ3JlZ2F0ZSBiYXNlZCBvbiBtdWx0aXBsZSBiYW5rcy4KPiA+ID4gPiBJIHNl
ZSwgNjk2YmYwYiAoImltYS1ldm0tdXRpbHM6IGNhbGN1bGF0ZSB0aGUgZGlnZXN0cyBmb3IgbXVs
dGlwbGUgVFBNIGJhbmtzIikKPiA+ID4gPiBJIHdvbmRlciB3aGV0aGVyIGl0J3MgcmVhc29uYWJs
ZSB0cnlpbmcgdG8gcG9ydCB0aGF0IHRvIGltYV9ib290X2FnZ3JlZ2F0ZS5jIG9yCj4gPiA+ID4g
anVzdCBkZXBlbmQgb24gZXZtY3RsLiBFeHRlcm5hbCBkZXBlbmRlbmNpZXMgYXJlIHNvbWV0aW1l
cyBjb21wbGljYXRlZCwgYnV0IGZvcgo+ID4gPiA+IElNQSBJIGluY2xpbmUgdG8ganVzdCByZXF1
aXJlIGV2bWN0bC4KPiA+IAo+ID4gPiBVbmxpa2UgVFBNIDEuMiwgdGhlIFRQTSAyLjAgZGV2aWNl
IGRyaXZlciBkb2Vzbid0IGV4cG9ydCB0aGUgVFBNIFBDUnMuCj4gPiA+IMKgTm90IG9ubHkgd291
bGQgeW91IGhhdmUgYSBkZXBlbmRlbmN5IG9uIGltYS1ldm0tdXRpbHMsIGJ1dCBhbHNvIG9uIGEK
PiA+ID4gdXNlcnNwYWNlIGFwcGxpY2F0aW9uKHMpIGZvciByZWFkaW5nIHRoZSBUUE0gUENScy4g
wqBUaGF0IGRlcGVuZGVuY3kKPiA+ID4gZXhpc3RzIHdoZXRoZXIgeW91J3JlIHVzaW5nIGV2bWN0
bCB0byBjYWxjdWxhdGUgdGhlIGJvb3RfYWdncmVnYXRlIG9yCj4gPiA+IGRvaW5nIGl0IHlvdXJz
ZWxmLgo+ID4gSG0sIHRoaW5ncyBnZXQgY29tcGxpY2F0ZWQuCj4gPiBZZXAgSSByZW1lbWJlciB5
b3VyIHBhdGNoIHRvIHNraXAgdmVyaWZ5aW5nIFRQTSAyLjAgUENSIHZhbHVlcwo+ID4gaHR0cHM6
Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2x0cC9wYXRjaC8xNTU4MDQxMTYyLjM5NzEu
Mi5jYW1lbEBsaW51eC5pYm0uY29tLwo+ID4gQXQgbGVhc3QgdGhhbmtzIHRvIEplcnJ5IFNuaXRz
ZWxhYXIgc2luY2UgdjUuNiB3ZSBoYXZlCj4gPiAvc3lzL2NsYXNzL3RwbS90cG0qL3RwbV92ZXJz
aW9uX21ham9yLiBXZSBjb3VsZCBjaGVjayB0aGlzICgrIHRyeSBhbHNvCj4gPiAvc3lzL2NsYXNz
L3RwbS90cG0wL2RldmljZS9kZXNjcmlwdGlvbiBmb3Igb2xkZXIga2VybmVscykuCj4gPiAKPiA+
IEJUVyBvbiBteSBzeXN0ZW0gdGhlcmUgaXMgYWxzbyAvc3lzL2NsYXNzL3RwbS90cG0wL3BwaS92
ZXJzaW9uLCB3aGljaCBoYXMgMS4yLAo+ID4gbm90IHN1cmUgaWYgaXQgaW5kaWNhdGUgVFBNIDEu
MiwgYnV0IEkgd291bGRuJ3QgcmVseSBvbiB0aGF0Lgo+ID4gCj4gCj4gSUlVQyAndHBtX3ZlcnNp
b25fbWFqb3InIHNob3VsZCBiZSB0aGUgb25seSBzYWZlIHJlZmVyZW5jZSBvZiB0aGUgYWN0dWFs
Cj4gVENHIHNwZWMgdmVyc2lvbiBiZWluZyBpbXBsZW1lbnRlZCBieSB0aGUgaHcgVFBNLCBpbiBh
IHN5c2ZzIHN0YW5kYXJkCj4gb3V0cHV0LgoKVGhhdCB3YXMgb25seSB1cHN0cmVhbWVkIGluIGxp
bnV4LXY1LjYuIMKgSGFzIGl0IGJlZW4gYmFja3BvcnRlZD8KClRoZSBQQ1JzIGFyZSBub3QgZXhw
b3J0ZWQgZm9yIFRQTSAyLjAsIHVuZm9ydHVuYXRlbHksIG1ha2luZwpyZWdyZXNzaW9uIHRlc3Rz
IGRlcGVuZGVudCBvbiBhIHVzZXJzcGFjZSBhcHAuIMKgVGhlIGV4aXN0aW5nIExUUAppbWFfdHBt
LnNoIHRlc3QgbG9va3MgZm9yIHRoZSBQQ1JzIGluIGVpdGhlcgovc3lzL2NsYXNzL3RwbS90cG0w
L2RldmljZS9wY3JzIG9yIC9zeXMvY2xhc3MvbWlzYy90cG0wL2RldmljZS9wY3JzLgrCoFBlcmhh
cHMgcGlnZ3liYWNrIG9uIHRoZSBwc2V1ZG8gUENSIGZpbGUgdG8gdGVzdCBmb3IgVFBNIDEuMi4K
Cj4gCj4gPiAuLi4KPiA+ID4gPiA+IFRoZXJlJ3MgYWxzbyBhIG5ldyB0ZXN0IHRvIHZlcmlmeSB0
aGUgYm9vdF9hZ2dyZWdhdGUuCj4gPiAKPiA+ID4gPiA+ICQgVkVSQk9TRT0xIG1ha2UgY2hlY2sg
VEVTVFM9Ym9vZ19hZ2dyZWdhdGUudGVzdAo+ID4gPiA+IEJUVyBJIGdvdCBzb21lIGVycm9ycwo+
ID4gPiA+IC4uLgo+ID4gPiA+IG1ha2UgIGNoZWNrLVRFU1RTCj4gPiA+ID4gbWFrZVsyXTogRW50
ZXJpbmcgZGlyZWN0b3J5ICcvaG9tZS9mb28vaW1hLWV2bS11dGlscy90ZXN0cycKPiA+ID4gPiBt
YWtlWzNdOiBFbnRlcmluZyBkaXJlY3RvcnkgJy9ob21lL2Zvby9pbWEtZXZtLXV0aWxzL3Rlc3Rz
Jwo+ID4gPiA+IG1ha2VbNF06IEVudGVyaW5nIGRpcmVjdG9yeSAnL2hvbWUvZm9vL2ltYS1ldm0t
dXRpbHMvdGVzdHMnCj4gPiA+ID4gbWFrZVs0XTogTm90aGluZyB0byBiZSBkb25lIGZvciAnYm9v
Z19hZ2dyZWdhdGUubG9nJy4KPiA+ID4gPiBtYWtlWzRdOiBMZWF2aW5nIGRpcmVjdG9yeSAnL2hv
bWUvZm9vL2ltYS1ldm0tdXRpbHMvdGVzdHMnCj4gPiA+ID4gZmF0YWw6IG1ha2luZyB0ZXN0LXN1
aXRlLmxvZzogZmFpbGVkIHRvIGNyZWF0ZSBib29nX2FnZ3JlZ2F0ZS50cnMKPiA+ID4gPiBmYXRh
bDogbWFraW5nIHRlc3Qtc3VpdGUubG9nOiBmYWlsZWQgdG8gY3JlYXRlIGJvb2dfYWdncmVnYXRl
LmxvZwo+ID4gPiA+IG1ha2VbM106ICoqKiBbTWFrZWZpbGU6NTE2OiB0ZXN0LXN1aXRlLmxvZ10g
RXJyb3IgMQo+ID4gPiA+IG1ha2VbM106IExlYXZpbmcgZGlyZWN0b3J5ICcvaG9tZS9mb28vaW1h
LWV2bS11dGlscy90ZXN0cycKPiA+ID4gPiBtYWtlWzJdOiAqKiogW01ha2VmaWxlOjYyNTogY2hl
Y2stVEVTVFNdIEVycm9yIDIKPiA+ID4gPiBtYWtlWzJdOiBMZWF2aW5nIGRpcmVjdG9yeSAnL2hv
bWUvZm9vL2ltYS1ldm0tdXRpbHMvdGVzdHMnCj4gPiA+ID4gbWFrZVsxXTogKioqIFtNYWtlZmls
ZTo2OTI6IGNoZWNrLWFtXSBFcnJvciAyCj4gPiA+ID4gbWFrZVsxXTogTGVhdmluZyBkaXJlY3Rv
cnkgJy9ob21lL2Zvby9pbWEtZXZtLXV0aWxzL3Rlc3RzJwo+ID4gPiA+IG1ha2U6ICoqKiBbTWFr
ZWZpbGU6NTE0OiBjaGVjay1yZWN1cnNpdmVdIEVycm9yIDEKPiA+IAo+ID4gPiBbQ2MnaW5nIFZp
dGFseV0KPiA+IAo+ID4gPiBUaGUgYm9vdF9hZ2dyZWdhdGUudHJzIGFuZCBib290X2FnZ3JlZ2F0
ZS5sb2cgZmlsZXMgYXJlIGJlaW5nIGNyZWF0ZWQKPiA+ID4gaW4gdGhlIHRlc3RzLyBkaXJlY3Rv
cnkuIMKgSXMgdGhhdCBkaXJlY3RvcnkgcmVhZC1vbmx5Pwo+ID4gWWVzLCBkcnd4ci14ci14LiBU
ZXN0aW5nIG9uIGZyZXNoIGNsb25lIGFuZCBpc3N1ZSBwZXJzaXN0cy4KPiA+IAo+IAo+IFllcywg
c2FtZSB0aGluZyBoZXJlLi4gYnV0IGRpZG4ndCByZWFsbHkgY2hlY2sgdGhlIHJlYXNvbiBmb3Ig
dGhhdC4gV2lsbAo+IHRha2UgYSB0aW1lIGxhdGVyIHRvIHNlZSB3aGF0J3MgaGFwcGVuaW5nLgoK
VGhhbmtzLCBtdWNoIGFwcHJlY2lhdGVkLiDCoEknbSBub3Qgc2VlaW5nIHRoYXQgaGVyZS4KCk1p
bWkKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5m
by9sdHAK
