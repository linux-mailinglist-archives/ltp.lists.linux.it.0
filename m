Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id EE542247503
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Aug 2020 21:18:15 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 838E73C58D1
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Aug 2020 21:18:15 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 504353C1CDD
 for <ltp@lists.linux.it>; Mon, 17 Aug 2020 21:18:12 +0200 (CEST)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 7D6AA1400DA1
 for <ltp@lists.linux.it>; Mon, 17 Aug 2020 21:18:11 +0200 (CEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07HJ3Qmk063018; Mon, 17 Aug 2020 15:18:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=YnmncETlClgxkDjJZtlzkxWzNj2RduTBUNp/5NODXQY=;
 b=k6LsRad5FMd2LtD/lTNoE5szeKqUtNveesMkBiJW0LfiKJ5kR4g//Eoxz9drdWcHVkWc
 C8tQlTcY7za/TFBN2pszcF7W1P8OUgRIp/3L4oHxya9cMDYLWfksSqEKEyWZyzVb9gf5
 t5FH/7tv97r4xUnpVnw4ErtsoiQFO+o0nijRJtoZuR6HP92TCjtcn2K4fGw8QBb43kJ+
 CHZJWtvEHL9Ouo/rUvLqnr2SYZZaSCaVk8rKCzxu2vlPyuZ93Rr1F8kgKdiJF1qwI95h
 OFCi5oWTPXMMemWRDztUZl+RWX45ShPV6hKwDfi4j9U72j5YVPTO4OdNtgWPGKOt02x0 Gw== 
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32y4kx4k9p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Aug 2020 15:18:07 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07HJ0IhY017719;
 Mon, 17 Aug 2020 19:18:05 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma02fra.de.ibm.com with ESMTP id 32x7b81jfa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Aug 2020 19:18:05 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07HJI30s17695170
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 Aug 2020 19:18:03 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0EBED5204E;
 Mon, 17 Aug 2020 19:18:03 +0000 (GMT)
Received: from li-f45666cc-3089-11b2-a85c-c57d1a57929f.ibm.com (unknown
 [9.160.31.252])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 1E14E52051;
 Mon, 17 Aug 2020 19:18:02 +0000 (GMT)
Message-ID: <bc89bf8e0c40e6d66c86b42f55f9bf69ec7e335e.camel@linux.ibm.com>
From: Mimi Zohar <zohar@linux.ibm.com>
To: Petr Vorel <pvorel@suse.cz>, ltp@lists.linux.it
Date: Mon, 17 Aug 2020 15:18:01 -0400
In-Reply-To: <20200817130916.27634-1-pvorel@suse.cz>
References: <20200817130916.27634-1-pvorel@suse.cz>
X-Mailer: Evolution 3.28.5 (3.28.5-12.el8) 
Mime-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-17_14:2020-08-17,
 2020-08-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 clxscore=1011 spamscore=0 malwarescore=0 phishscore=0 mlxlogscore=999
 mlxscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008170131
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 0/4] IMA: verify measurement of certificate
 imported into a keyring
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
Cc: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
 Mimi Zohar <zohar@linux.vnet.ibm.com>, linux-integrity@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Mon, 2020-08-17 at 15:09 +0200, Petr Vorel wrote:
> Hi Mimi, Lakshmi,
> 
> changes v2->v3:
> fixed regression in my third commit.
> (please verify it on installed LTP, or at least run make install in
> testcases/kernel/security/integrity/ima/datafiles/ima_keys/)

I did, but nothing changed.  I probably need to set an environment
variable.

After building and installing LTP, it's finding the file, but some of
the issues still exist:

ima_keys 1 TINFO: $TMPDIR is on tmpfs => run on loop device
ima_keys 1 TINFO: Formatting /dev/loop0 with ext3 extra opts=''
ima_keys 1 TINFO: verify key measurement for keyrings and templates specified in IMA policy
grep: Unmatched ( or \(
ima_keys 1 TPASS: specified keyrings were measured correctly
ima_keys 2 TINFO: verify measurement of certificate imported into a keyring
keyctl_session_to_parent: Operation not permitted
ima_keys 2 TPASS: logged certificate matches the original

IMA policy:
measure func=KEY_CHECK keyrings=.ima|.evm|.builtin_trusted_keys|.blacklist|key_import_test template=ima-buf 
measure func=KEY_CHECK keyrings=key_import_test template=ima-buf 

Mimi


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
