Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C2311E2101
	for <lists+linux-ltp@lfdr.de>; Tue, 26 May 2020 13:39:15 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8951E3C3293
	for <lists+linux-ltp@lfdr.de>; Tue, 26 May 2020 13:39:13 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id A99043C326F
 for <ltp@lists.linux.it>; Tue, 26 May 2020 13:39:09 +0200 (CEST)
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id C9D2C1000CA0
 for <ltp@lists.linux.it>; Tue, 26 May 2020 13:39:08 +0200 (CEST)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 04QBW7d7027863
 for <ltp@lists.linux.it>; Tue, 26 May 2020 11:39:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : subject :
 date : message-id : mime-version : content-type :
 content-transfer-encoding; s=corp-2020-01-29;
 bh=k6HduwDZtbewd/2ZeT7kCKB51C9oBizPkiubmgHX1Aw=;
 b=gp32S79WAKs601qUaVJPONOS3Gy8Ivu2h792/KqHCL8lIuUR6daptw0bedLagaDPcemR
 gkNwuZscv+lD+NgieKnzuYT9DNZ7b3J/KZKXxr6fUo089egKWVYxAjN7B+85aDCxfZUc
 CS8/KRKUAb6SjeDVID8mKknIneD3vi59Rna6xMkdaJkeMyMM/SRV7UUbwwJslvXAYUvK
 MtKYXpxOS7VpqnvvvfG1VBz3ON9npH/RbFWhADc0OvRiDVWtht6DPtgzQ+aQ8NeuaACL
 5q7AQhgrNdKTe+dooSDseAuXsOCkXbg2MSxcuy6duznpGiKdv9yS61TtX1HoBs//4/MI fw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2120.oracle.com with ESMTP id 318xe1970t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <ltp@lists.linux.it>; Tue, 26 May 2020 11:39:03 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 04QBXXW9196352
 for <ltp@lists.linux.it>; Tue, 26 May 2020 11:39:02 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3020.oracle.com with ESMTP id 317dks9euy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <ltp@lists.linux.it>; Tue, 26 May 2020 11:39:02 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 04QBd0aR023088
 for <ltp@lists.linux.it>; Tue, 26 May 2020 11:39:02 GMT
Received: from fujitsu.nl.oracle.com (/10.175.5.154)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 26 May 2020 04:38:59 -0700
From: Stanislav Kholmanskikh <stanislav.kholmanskikh@oracle.com>
To: ltp@lists.linux.it
Date: Tue, 26 May 2020 14:38:47 +0300
Message-Id: <20200526113847.6837-1-stanislav.kholmanskikh@oracle.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9632
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 malwarescore=0 bulkscore=0
 spamscore=0 suspectscore=1 mlxscore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2005260087
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9632
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxlogscore=999
 adultscore=0 cotscore=-2147483648 mlxscore=0 bulkscore=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1011 impostorscore=0 suspectscore=1 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2005260087
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH] acct02: fix the ac_version check on big endian
 platforms
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

SWYgd2UgYXJlIG9uIGEgYmlnIGVuZGlhbiBwbGF0Zm9ybSB3aGVyZSBjaGFyIGlzIHNpZ25lZCwK
dGhlIGZvbGxvd2luZyBjb21waWxhdGlvbiBlcnJvciBpcyBlbWl0dGVkOgoKYWNjdDAyLmM6IElu
IGZ1bmN0aW9uIOKAmHZlcmlmeV9hY2N04oCZOgphY2N0MDIuYzozODozNzogd2FybmluZzogY29t
cGFyaXNvbiBpcyBhbHdheXMgdHJ1ZSBkdWUgdG8gbGltaXRlZCByYW5nZSBvZiBkYXRhIHR5cGUg
Wy1XdHlwZS1saW1pdHNdCiAjZGVmaW5lIEFDQ1RfTUVNQkVSX1YzKHgpICgoKHN0cnVjdCBhY2N0
X3YzICopYWNjKS0+eCkKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4KYWNj
dDAyLmM6MTQ0OjY6IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBtYWNybyDigJhBQ0NUX01FTUJFUl9W
M+KAmQogIGlmIChBQ0NUX01FTUJFUl9WMyhhY192ZXJzaW9uKSAhPSAoMyB8IEFDQ1RfQllURU9S
REVSKSkgewoKYW5kIHRoZSB0ZXN0IGNhc2UgZmFpbHMsIGJlY2F1c2UgaXQgY2Fubm90ICdkZWNy
eXB0JyB0aGUgYWNfdmVyc2lvbgpmcm9tIHRoZSBmaWxlOgoKYWNjdDAyLmM6MjM4OiBJTkZPOiBW
ZXJpZnlpbmcgdXNpbmcgJ3N0cnVjdCBhY2N0X3YzJwphY2N0MDIuYzoxOTE6IElORk86ID09IGVu
dHJ5IDEgPT0KYWNjdDAyLmM6MTQ2OiBJTkZPOiBhY192ZXJzaW9uICE9IDMgKC0xMjUpCgpPbmUg
d2F5IHRvIGFkZHJlc3MgdGhhdCBpcyB0byBleHBsaWNpdGx5IGNhc3QgdGhlIGV4cHJlc3Npb24K
d2UgY29tcGFyZSB0byAod2hpY2ggaXMgaW50KSB0byB0aGUgdHlwZSBvZiBhY192ZXJzaW9uICh3
aGljaCBpcyBjaGFyKS4KClNpZ25lZC1vZmYtYnk6IFN0YW5pc2xhdiBLaG9sbWFuc2tpa2ggPHN0
YW5pc2xhdi5raG9sbWFuc2tpa2hAb3JhY2xlLmNvbT4KLS0tCiB0ZXN0Y2FzZXMva2VybmVsL3N5
c2NhbGxzL2FjY3QvYWNjdDAyLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxz
L2FjY3QvYWNjdDAyLmMgYi90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2FjY3QvYWNjdDAyLmMK
aW5kZXggZDZiMTZiOC4uOGVlMWJmYyAxMDA2NDQKLS0tIGEvdGVzdGNhc2VzL2tlcm5lbC9zeXNj
YWxscy9hY2N0L2FjY3QwMi5jCisrKyBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvYWNjdC9h
Y2N0MDIuYwpAQCAtMTQxLDcgKzE0MSw3IEBAIHN0YXRpYyBpbnQgdmVyaWZ5X2FjY3Qodm9pZCAq
YWNjLCBpbnQgZWxhcF90aW1lKQogCQlyZXQgPSAxOwogCX0KIAotCWlmIChBQ0NUX01FTUJFUl9W
MyhhY192ZXJzaW9uKSAhPSAoMyB8IEFDQ1RfQllURU9SREVSKSkgeworCWlmIChBQ0NUX01FTUJF
Ul9WMyhhY192ZXJzaW9uKSAhPSAoY2hhcikoMyB8IEFDQ1RfQllURU9SREVSKSkgewogCQl0c3Rf
cmVzKFRJTkZPLCAiYWNfdmVyc2lvbiAhPSAzICglZCkiLAogCQkJQUNDVF9NRU1CRVJfVjMoYWNf
dmVyc2lvbikpOwogCQlyZXQgPSAxOwotLSAKMS44LjMuMQoKCi0tIApNYWlsaW5nIGxpc3QgaW5m
bzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
