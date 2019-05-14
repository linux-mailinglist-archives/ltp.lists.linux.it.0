Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 616861C5E6
	for <lists+linux-ltp@lfdr.de>; Tue, 14 May 2019 11:21:09 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 39C9F3EA20A
	for <lists+linux-ltp@lfdr.de>; Tue, 14 May 2019 11:21:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id C49923EA1DC
 for <ltp@lists.linux.it>; Tue, 14 May 2019 11:21:07 +0200 (CEST)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 64DD51401A17
 for <ltp@lists.linux.it>; Tue, 14 May 2019 11:21:05 +0200 (CEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4E99RaV101091
 for <ltp@lists.linux.it>; Tue, 14 May 2019 05:21:04 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2sftp6rreh-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <ltp@lists.linux.it>; Tue, 14 May 2019 05:21:03 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <ltp@lists.linux.it> from <heiko.carstens@de.ibm.com>;
 Tue, 14 May 2019 10:21:01 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 14 May 2019 10:20:57 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x4E9KuoB51052608
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 14 May 2019 09:20:56 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 94131A4051;
 Tue, 14 May 2019 09:20:56 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 441F5A4053;
 Tue, 14 May 2019 09:20:56 +0000 (GMT)
Received: from osiris (unknown [9.152.212.21])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Tue, 14 May 2019 09:20:56 +0000 (GMT)
Date: Tue, 14 May 2019 11:20:54 +0200
From: Heiko Carstens <heiko.carstens@de.ibm.com>
To: Jan Stancek <jstancek@redhat.com>, "Theodore Ts'o" <tytso@mit.edu>
References: <CA+G9fYuLXPnCmpnnLqBf5qinV6wrFx=HBH2KrB8s1HmCxLM=Zw@mail.gmail.com>
 <1723398651.22256606.1557731771283.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1723398651.22256606.1557731771283.JavaMail.zimbra@redhat.com>
X-TM-AS-GCONF: 00
x-cbid: 19051409-0012-0000-0000-0000031B773C
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19051409-0013-0000-0000-000021540E58
Message-Id: <20190514092054.GA6949@osiris>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-14_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905140067
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Cc: Richard Weinberger <richard.weinberger@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org,
 linux-ext4@vger.kernel.org, Arthur Marsh <arthur.marsh@internode.on.net>,
 ltp@lists.linux.it
Subject: Re: [LTP] LTP: Syscalls: 274 failures: EROFS(30): Read-only file
 system
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

T24gTW9uLCBNYXkgMTMsIDIwMTkgYXQgMDM6MTY6MTFBTSAtMDQwMCwgSmFuIFN0YW5jZWsgd3Jv
dGU6Cj4gLS0tLS0gT3JpZ2luYWwgTWVzc2FnZSAtLS0tLQo+ID4gV2UgaGF2ZSBub3RpY2VkIDI3
NCBzeXNjYWxsIHRlc3QgZmFpbHVyZXMgb24geDg2XzY0IGFuZCBpMzg2IGR1ZSB0bwo+ID4gTWFr
ZSB0aGUgdGVtcG9yYXJ5IGRpcmVjdG9yeSBpbiBvbmUgc2hvdCB1c2luZyBta2R0ZW1wIGZhaWxl
ZC4KPiA+IHRzdF90bXBkaXIuYzoyNjQ6IEJST0s6IHRzdF90bXBkaXI6Cj4gPiBta2R0ZW1wKC9z
Y3JhdGNoL2x0cC03RDh2QWNZZUZHL09YdXF1SikgZmFpbGVkOiBFUk9GUwo+IAo+IExvb2tzIGxp
a2UgZXh0NCBidWc6Cj4gCj4gWyAxOTE2LjAzMjA4N10gRVhUNC1mcyBlcnJvciAoZGV2aWNlIHNk
YSk6IGV4dDRfZmluZF9leHRlbnQ6OTA5OiBpbm9kZSAjODogY29tbSBqYmQyL3NkYS04OiBwYmxr
IDEyMTY2NzU4MyBiYWQgaGVhZGVyL2V4dGVudDogaW52YWxpZCBleHRlbnQgZW50cmllcyAtIG1h
Z2ljIGYzMGEsIGVudHJpZXMgOCwgbWF4IDM0MCgzNDApLCBkZXB0aCAwKDApCj4gWyAxOTE2LjA3
Mzg0MF0gamJkMl9qb3VybmFsX2JtYXA6IGpvdXJuYWwgYmxvY2sgbm90IGZvdW5kIGF0IG9mZnNl
dCA0NDU1IG9uIHNkYS04Cj4gWyAxOTE2LjA4MTA3MV0gQWJvcnRpbmcgam91cm5hbCBvbiBkZXZp
Y2Ugc2RhLTguCj4gWyAxOTE2LjM0ODY1Ml0gRVhUNC1mcyBlcnJvciAoZGV2aWNlIHNkYSk6IGV4
dDRfam91cm5hbF9jaGVja19zdGFydDo2MTogRGV0ZWN0ZWQgYWJvcnRlZCBqb3VybmFsCj4gWyAx
OTE2LjM1NzIyMl0gRVhUNC1mcyAoc2RhKTogUmVtb3VudGluZyBmaWxlc3lzdGVtIHJlYWQtb25s
eQo+IAo+IFNvIGJlc3QgcGxhY2UgZm9yIHJlcG9ydCBpcyBsaWtlbHkgbGludXgtZXh0NEB2Z2Vy
Lmtlcm5lbC5vcmcKCkFjdHVhbGx5IGFkZGluZyB0aGUgbWFpbGluZyBsaXN0LCBzaW5jZSB0aGVy
ZSBoYXMgYmVlbiBhdCBsZWFzdCBvbmUKb3RoZXIgcmVwb3J0IGFib3V0IGV4dDQgZmlsZXN5c3Rl
bSBjb3JydXB0aW9uLgoKRldJVywgSSd2ZSBzZWVuIHRoZSBhYm92ZSBhbHNvIGF0IGxlYXN0IG9u
Y2Ugb24gczM5MCB3aGVuIHVzaW5nIGEKa2VybmVsIGJ1aWx0IHdpdGggZ2l0IGNvbW1pdCA0Nzc4
MjM2MWFjYTIuCgo+ID4gCj4gPiBGYWlsZWQgbG9nOgo+ID4gLS0tLS0tLS0tLS0tCj4gPiBwcmVh
ZDAxICAgICAxICBUQlJPSyAgOiAgdHN0X3RtcGRpci5jOjI2NDogdHN0X3RtcGRpcjoKPiA+IG1r
ZHRlbXAoL3NjcmF0Y2gvbHRwLTdEOHZBY1llRkcvcHJlQVV2WEFFKSBmYWlsZWQ6IGVycm5vPUVS
T0ZTKDMwKToKPiA+IFJlYWQtb25seSBmaWxlIHN5c3RlbQo+ID4gcHJlYWQwMSAgICAgMiAgVEJS
T0sgIDogIHRzdF90bXBkaXIuYzoyNjQ6IFJlbWFpbmluZyBjYXNlcyBicm9rZW4KPiA+IAo+ID4g
ZnVsbCB0ZXN0IGxvZywKPiA+IC0tLS0tLS0tLS0tLS0tCj4gPiBodHRwczovL2xrZnQudmFsaWRh
dGlvbi5saW5hcm8ub3JnL3NjaGVkdWxlci9qb2IvNzExODI2I0w3ODM0Cj4gPiAKPiA+IExUUCBW
ZXJzaW9uOiAyMDE5MDExNQo+ID4gCj4gPiBLZXJuZWwgYmFkIGNvbW1pdDoKPiA+IC0tLS0tLS0t
LS0tLQo+ID4gZ2l0IGJyYW5jaCBtYXN0ZXIKPiA+IGdpdCBjb21taXQgZGQ1MDAxZTIxYTk5MWI3
MzFkNjU5ODU3Y2QwN2FjYzdhMTNlNjc4OQo+ID4gZ2l0IGRlc2NyaWJlIHY1LjEtMzQ4Ni1nZGQ1
MDAxZTIxYTk5Cj4gPiBnaXQgcmVwbyBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGlu
dXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQKPiA+IAo+ID4gS2VybmVsIGdvb2QgY29t
bWl0Ogo+ID4gLS0tLS0tLS0tLS0tCj4gPiBnaXQgYnJhbmNoIG1hc3Rlcgo+ID4gZ2l0IGNvbW1p
dCBkMzUxMWY1M2JiMjQ3NWYyYTRlODQ2MGJlZTVhMWFlNmRlYTJhNDMzCj4gPiBnaXQgZGVzY3Jp
YmUgdjUuMS0zMzg1LWdkMzUxMWY1M2JiMjQKPiA+IGdpdCByZXBvIGh0dHBzOi8vZ2l0Lmtlcm5l
bC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdAo+ID4gCj4g
PiBCZXN0IHJlZ2FyZHMKPiA+IE5hcmVzaCBLYW1ib2p1Cj4gPiAKPiAKPiAtLSAKPiBNYWlsaW5n
IGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAKCgotLSAKTWFp
bGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
