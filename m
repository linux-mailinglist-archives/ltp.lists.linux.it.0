Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D65C62DD58B
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Dec 2020 17:57:06 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7AD373C705F
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Dec 2020 17:57:06 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id BC6E53C57B4
 for <ltp@lists.linux.it>; Thu, 17 Dec 2020 17:57:02 +0100 (CET)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id A3EE814012BC
 for <ltp@lists.linux.it>; Thu, 17 Dec 2020 17:57:01 +0100 (CET)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0BHGjjPt055827; Thu, 17 Dec 2020 11:56:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=gJos5ncnoCS2r+fHlV22ImN7sk1ihPQUjja817/z6tA=;
 b=WyU6cGg9rYBBoFToNxrDAydaRnYjOYnXpWFYNQ/Yojq8ahXnk1F+gZy9juqIPhtP4yW+
 TTbE23+fQaV+DcXVtk5yrpWJERhiE1C8VTmDDiyScWflH8nbDdQ8O35AmMqQN+LwanE2
 GbozWx2b5+HP+oK609Jd/92IAEt8I+oqgkX17u2CcpBF/VaHpMctNgEMge8LNF8xHJWO
 c9VfAoJFMti5+9fgyzvTEqfh3ZCn9X6/I9nGxlpadKdQeOTdODfmd4/7EL/ZhgoVXRo5
 NTLgth5jJRYQVG4mcoDDpVlbQtBEnW2ffZfAGF0I8HpXTx02r0uYZe4ey3x6uf6yg47Z xw== 
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0b-001b2d01.pphosted.com with ESMTP id 35gb4vr8rw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Dec 2020 11:56:58 -0500
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0BHGqTqe005595;
 Thu, 17 Dec 2020 16:56:56 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06fra.de.ibm.com with ESMTP id 35d310ama2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Dec 2020 16:56:56 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0BHGurLk31850822
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Dec 2020 16:56:53 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BBA1611C078;
 Thu, 17 Dec 2020 16:56:53 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6F43211C07F;
 Thu, 17 Dec 2020 16:56:52 +0000 (GMT)
Received: from sig-9-65-203-134.ibm.com (unknown [9.65.203.134])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 17 Dec 2020 16:56:52 +0000 (GMT)
Message-ID: <aed2e8ee7b05772a8cc2988ae275282bec7ef504.camel@linux.ibm.com>
From: Mimi Zohar <zohar@linux.ibm.com>
To: Petr Vorel <pvorel@suse.cz>, ltp@lists.linux.it
Date: Thu, 17 Dec 2020 11:56:51 -0500
In-Reply-To: <20201214221946.6340-2-pvorel@suse.cz>
References: <20201214221946.6340-1-pvorel@suse.cz>
 <20201214221946.6340-2-pvorel@suse.cz>
X-Mailer: Evolution 3.28.5 (3.28.5-12.el8) 
Mime-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-17_10:2020-12-15,
 2020-12-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 adultscore=0
 mlxlogscore=999 clxscore=1015 suspectscore=0 malwarescore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012170110
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v5 1/4] IMA: Move get_algorithm_digest(),
 set_digest_index() to ima_setup.sh
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
Cc: Tushar Sugandhi <tusharsu@linux.microsoft.com>,
 Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
 linux-integrity@vger.kernel.org, Mimi Zohar <zohar@linux.vnet.ibm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Petr,

Thank you!

On Mon, 2020-12-14 at 23:19 +0100, Petr Vorel wrote:
> To be reusable by more tests (preparation for next commit).
> 
> Call set_digest_index() inside get_algorithm_digest() if needed
> instead of expecting get_algorithm_digest() caller to call
> set_digest_index() before.

For the existing builtin templates, the algorithm/digest field is
consistent.  With support for per policy rule template formats, there
isn't necessarily a single template format for the entire list.

In the future "set_digest_index" might need to be renamed to
"get_digest_index" and the lookup done for each line.

> 
> Signed-off-by: Petr Vorel <pvorel@suse.cz>

Reviewed-by: Mimi Zohar <zohar@linux.ibm.com>


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
