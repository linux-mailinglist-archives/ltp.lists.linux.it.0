Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E41392F78DD
	for <lists+linux-ltp@lfdr.de>; Fri, 15 Jan 2021 13:26:09 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9A5C23C6A0D
	for <lists+linux-ltp@lfdr.de>; Fri, 15 Jan 2021 13:26:09 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 30A1A3C0BCB
 for <ltp@lists.linux.it>; Fri, 15 Jan 2021 13:26:07 +0100 (CET)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 7EA73200FEF
 for <ltp@lists.linux.it>; Fri, 15 Jan 2021 13:26:06 +0100 (CET)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10FC209O008595
 for <ltp@lists.linux.it>; Fri, 15 Jan 2021 07:26:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=PB3rP53YcfT+skzj2ZVCRbxvdqIxA0psTpVQnV+fqpQ=;
 b=AxvjI/QCvUGNoybitHtFX8CRzbf7hgfKlUa9K4X1OcXWtOBd3meJackfxT+ysruO1Ktt
 Yypxmq6Kd4CEhM32duqvPCtvmM3khLjMlnNXv+2iAGYOHI77zdZxqSLjmalPqMTw1Td6
 2eSg4LCyJxO66XiI7QX1yoa8LefS7gRckpzpuPdArrhaFQkzD9uUwOjIO2hEDa9SlH7K
 DT7JYLMyiggKikzRmWsy/z9+MH2ckrdYJSY5w764s0xRnmUKFDcc8Z8i20lE4VtUkB0p
 rT5l1gGxdS41gywh/GiLJOsrzzAZPKDrBnWsutEAzowpEaArUY2mbZ7a5s/I3sOdfoDm 5Q== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 363a3qsrwc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <ltp@lists.linux.it>; Fri, 15 Jan 2021 07:26:04 -0500
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10FC8CmF014079
 for <ltp@lists.linux.it>; Fri, 15 Jan 2021 12:26:02 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma06ams.nl.ibm.com with ESMTP id 35ydrdf9ba-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <ltp@lists.linux.it>; Fri, 15 Jan 2021 12:26:02 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10FCPxc222282646
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 15 Jan 2021 12:25:59 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7D528A4053;
 Fri, 15 Jan 2021 12:25:59 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7CAA1A4040;
 Fri, 15 Jan 2021 12:25:58 +0000 (GMT)
Received: from oc8242746057.ibm.com.com (unknown [9.171.20.24])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 15 Jan 2021 12:25:58 +0000 (GMT)
From: Alexander Egorenkov <egorenar@linux.ibm.com>
To: ltp@lists.linux.it
Date: Fri, 15 Jan 2021 13:25:43 +0100
Message-Id: <20210115122543.288948-1-egorenar@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-15_07:2021-01-15,
 2021-01-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 phishscore=0 mlxscore=0 impostorscore=0 adultscore=0 suspectscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 mlxlogscore=838 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101150071
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 1/1] swapping01: fix parameter truncation in abs
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

UGFyYW1ldGVycyBwYXNzZWQgdG8gYWJzKGludCkgYXJlIG9mIHR5cGUgbG9uZy4gVXNlIGxhYnMo
bG9uZykgaW5zdGVhZAp0byBhdm9pZCB2YWx1ZSB0cnVuY2F0aW9uLgoKRml4ZXMgdGhlIGZvbGxv
d2luZyB3YXJuaW5nOgoKc3dhcHBpbmcwMS5jOiBJbiBmdW5jdGlvbiDigJhjaGVja19zd2FwcGlu
Z+KAmToKc3dhcHBpbmcwMS5jOjEzMzo3OiB3YXJuaW5nOiBhYnNvbHV0ZSB2YWx1ZSBmdW5jdGlv
biDigJhhYnPigJkgZ2l2ZW4gYW4gYXJndW1lbnQgb2YgdHlwZSDigJhsb25nIGludOKAmSBidXQg
aGFzIHBhcmFtZXRlciBvZiB0eXBlIOKAmGludOKAmSB3aGljaCBtYXkgY2F1c2UgdHJ1bmNhdGlv
biBvZiB2YWx1ZSBbLVdhYnNvbHV0ZS12YWx1ZV0KICAxMzMgfCAgIGlmIChhYnMoc3dhcF9mcmVl
X25vdyAtIFNBRkVfUkVBRF9NRU1JTkZPKCJTd2FwRnJlZToiKSkgPCA1MTIpCiAgICAgIHwgICAg
ICAgXn5+CgpTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kZXIgRWdvcmVua292IDxlZ29yZW5hckBsaW51
eC5pYm0uY29tPgotLS0KIHRlc3RjYXNlcy9rZXJuZWwvbWVtL3N3YXBwaW5nL3N3YXBwaW5nMDEu
YyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoK
ZGlmZiAtLWdpdCBhL3Rlc3RjYXNlcy9rZXJuZWwvbWVtL3N3YXBwaW5nL3N3YXBwaW5nMDEuYyBi
L3Rlc3RjYXNlcy9rZXJuZWwvbWVtL3N3YXBwaW5nL3N3YXBwaW5nMDEuYwppbmRleCBmZjQwYzg1
YzAuLjI0YjgzMTNmMyAxMDA2NDQKLS0tIGEvdGVzdGNhc2VzL2tlcm5lbC9tZW0vc3dhcHBpbmcv
c3dhcHBpbmcwMS5jCisrKyBiL3Rlc3RjYXNlcy9rZXJuZWwvbWVtL3N3YXBwaW5nL3N3YXBwaW5n
MDEuYwpAQCAtMTMwLDcgKzEzMCw3IEBAIHN0YXRpYyB2b2lkIGNoZWNrX3N3YXBwaW5nKHZvaWQp
CiAJd2hpbGUgKGkgPCAxMCkgewogCQlzd2FwX2ZyZWVfbm93ID0gU0FGRV9SRUFEX01FTUlORk8o
IlN3YXBGcmVlOiIpOwogCQlzbGVlcCgxKTsKLQkJaWYgKGFicyhzd2FwX2ZyZWVfbm93IC0gU0FG
RV9SRUFEX01FTUlORk8oIlN3YXBGcmVlOiIpKSA8IDUxMikKKwkJaWYgKGxhYnMoc3dhcF9mcmVl
X25vdyAtIFNBRkVfUkVBRF9NRU1JTkZPKCJTd2FwRnJlZToiKSkgPCA1MTIpCiAJCQlicmVhazsK
IAogCQlpKys7Ci0tIAoyLjI2LjIKCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlz
dHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
