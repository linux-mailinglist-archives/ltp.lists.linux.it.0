Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A26642195D
	for <lists+linux-ltp@lfdr.de>; Fri, 17 May 2019 15:50:57 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 777D23EA5B4
	for <lists+linux-ltp@lfdr.de>; Fri, 17 May 2019 15:50:57 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id EEC3A3EA36A
 for <ltp@lists.linux.it>; Fri, 17 May 2019 15:50:55 +0200 (CEST)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 8D69F1A05192
 for <ltp@lists.linux.it>; Fri, 17 May 2019 15:50:53 +0200 (CEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4HDbNOV133954
 for <ltp@lists.linux.it>; Fri, 17 May 2019 09:50:52 -0400
Received: from e36.co.us.ibm.com (e36.co.us.ibm.com [32.97.110.154])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2shv8rwvu8-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <ltp@lists.linux.it>; Fri, 17 May 2019 09:50:51 -0400
Received: from localhost
 by e36.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <ltp@lists.linux.it> from <nayna@linux.vnet.ibm.com>;
 Fri, 17 May 2019 14:50:50 +0100
Received: from b03cxnp08028.gho.boulder.ibm.com (9.17.130.20)
 by e36.co.us.ibm.com (192.168.1.136) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 17 May 2019 14:50:48 +0100
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x4HDolkN22348136
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 17 May 2019 13:50:47 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 465FE7805C;
 Fri, 17 May 2019 13:50:47 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 70DC178064;
 Fri, 17 May 2019 13:50:46 +0000 (GMT)
Received: from swastik.ibm.com (unknown [9.85.137.121])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 17 May 2019 13:50:46 +0000 (GMT)
To: Mimi Zohar <zohar@linux.ibm.com>,
 linux-integrity <linux-integrity@vger.kernel.org>
References: <1558041162.3971.2.camel@linux.ibm.com>
From: Nayna <nayna@linux.vnet.ibm.com>
Date: Fri, 17 May 2019 09:50:45 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1558041162.3971.2.camel@linux.ibm.com>
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19051713-0020-0000-0000-00000EEACC21
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011112; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01204635; UDB=6.00632408; IPR=6.00985570; 
 MB=3.00026931; MTD=3.00000008; XFM=3.00000015; UTC=2019-05-17 13:50:50
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19051713-0021-0000-0000-000065DC5BC1
Message-Id: <fccc3abd-f3ce-fdb1-55d7-c18ce116446c@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-17_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905170087
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH] ima: skip verifying TPM 2.0 PCR values
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

CgpPbiAwNS8xNi8yMDE5IDA1OjEyIFBNLCBNaW1pIFpvaGFyIHdyb3RlOgo+IFRQTSAxLjIgZXhw
b3J0ZWQgdGhlIFBDUnMuICBSZWFkaW5nIHRoZSBUUE0gMi4wIFBDUnMgcmVxdWlyZXMgYQo+IHVz
ZXJzcGFjZSBhcHBsaWNhdGlvbi4gIEZvciBub3csIHNraXAgdGhpcyB0ZXN0Lgo+Cj4gU2lnbmVk
LW9mZi1ieTogTWltaSBab2hhciA8em9oYXJAbGludXguaWJtLmNvbT4KPiAtLS0KPiAgIHRlc3Rj
YXNlcy9rZXJuZWwvc2VjdXJpdHkvaW50ZWdyaXR5L2ltYS90ZXN0cy9pbWFfdHBtLnNoIHwgOCAr
KysrKysrKwo+ICAgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdp
dCBhL3Rlc3RjYXNlcy9rZXJuZWwvc2VjdXJpdHkvaW50ZWdyaXR5L2ltYS90ZXN0cy9pbWFfdHBt
LnNoIGIvdGVzdGNhc2VzL2tlcm5lbC9zZWN1cml0eS9pbnRlZ3JpdHkvaW1hL3Rlc3RzL2ltYV90
cG0uc2gKPiBpbmRleCAwZmZjM2MwMjI0N2QuLmViZTRiNGMzNjBlNCAxMDA3NTUKPiAtLS0gYS90
ZXN0Y2FzZXMva2VybmVsL3NlY3VyaXR5L2ludGVncml0eS9pbWEvdGVzdHMvaW1hX3RwbS5zaAo+
ICsrKyBiL3Rlc3RjYXNlcy9rZXJuZWwvc2VjdXJpdHkvaW50ZWdyaXR5L2ltYS90ZXN0cy9pbWFf
dHBtLnNoCj4gQEAgLTg4LDYgKzg4LDE0IEBAIHRlc3QyKCkKPiAgIAl0c3RfcmVzIFRJTkZPICJ2
ZXJpZnkgUENSIHZhbHVlcyIKPiAgIAl0c3RfY2hlY2tfY21kcyBldm1jdGwKPgo+ICsJbG9jYWwg
dHBtX2Rlc2NyaXB0aW9uPSIvc3lzL2NsYXNzL3RwbS90cG0wL2RldmljZS9kZXNjcmlwdGlvbiIK
CgpJIGRvIG5vdCBzZWUgYSAiZGVzY3JpcHRpb24iIGZpbGUgb24gZWl0aGVyIG15IFBvd2VyUEMg
b3IgeDg2IHN5c3RlbXMgCndpdGggVFBNIDIuMC7CoCBQZXJoYXBzIGluc3RlYWQgb2YgdGVzdGlu
ZyBmb3IgdGhlICJkZXNjcmlwdGlvbiIgZmlsZSwgaWYgCnRoZSAicGNycyIgZmlsZSBpcyBub3Qg
Zm91bmQsIGVtaXQgYSBtb3JlIHZlcmJvc2UgaW5mb3JtYXRpb25hbCBtZXNzYWdlLCAKZm9yIGVn
LiAtICJwY3JzIGZpbGUgaXMgbm90IGZvdW5kIC0gZWl0aGVyIHlvdSBhcmUgcnVubmluZyBhIFRQ
TSAyLjAsIG9yIApoYXZpbmcgc3lzZnMgZmFpbGVkIHRvIHNob3cgcGNycyBmb3IgVFBNIDEuMiIK
ClRoYW5rcyAmIFJlZ2FyZHMsCiDCoMKgwqDCoMKgIC0gTmF5bmEKCgotLSAKTWFpbGluZyBsaXN0
IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
