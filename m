Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA5C27DB34
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Sep 2020 23:56:27 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D116E3C2AAC
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Sep 2020 23:56:26 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id A9B263C04C3
 for <ltp@lists.linux.it>; Tue, 29 Sep 2020 23:56:24 +0200 (CEST)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id DE101200342
 for <ltp@lists.linux.it>; Tue, 29 Sep 2020 23:56:23 +0200 (CEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08TLVkdh050038; Tue, 29 Sep 2020 17:56:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=puOLyKM5pfv9vyDZE/UuXF13SbaQEL3DW16pG41B4Hs=;
 b=VZ566bEqlu+uum1TI901pAdUzRtcv4aBXOhdJEyuCU6w5/I/4/D75EyWx18Hd/U0+QZd
 D6saBs9wxt+yozHCIRh8vpK4pzSiZ2pzOeuyaD/Igikz0L30imy/HRjmOn8peOo0GdtY
 FcXqDPAsaAnlKRXF9EqhCR2wKBMpWTMFIEjD6q+kG5Ixms3qkjsQLzdhJGgW9BmGsW4a
 L2CjfxWXC2jqNrCIVjqdhOtETY38A7aMgfOfmlmJb8Z01XC6ixLQeuO4vwsFVJE/4Fmy
 AVqSz8Uo2/6rS0A//4X3ZUVUjOtFgc5ETVv+uP2IlhG6EUZ/wgG5T9SSrx/BmuchzS48 Ww== 
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33vc56ssce-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Sep 2020 17:56:20 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 08TLkuMI028297;
 Tue, 29 Sep 2020 21:56:18 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma02fra.de.ibm.com with ESMTP id 33sw981yuh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Sep 2020 21:56:18 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 08TLuGTC27001316
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 29 Sep 2020 21:56:16 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7A17C5204F;
 Tue, 29 Sep 2020 21:56:16 +0000 (GMT)
Received: from li-f45666cc-3089-11b2-a85c-c57d1a57929f.ibm.com (unknown
 [9.160.90.38])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id ABBD15204E;
 Tue, 29 Sep 2020 21:56:15 +0000 (GMT)
Message-ID: <48cbcb6c03d0938a2e6e97a5b8ca08cac9b706a8.camel@linux.ibm.com>
From: Mimi Zohar <zohar@linux.ibm.com>
To: Petr Vorel <pvorel@suse.cz>, ltp@lists.linux.it
Date: Tue, 29 Sep 2020 17:56:15 -0400
In-Reply-To: <20200929165330.GA11939@dell5510>
References: <20200929165021.11731-1-pvorel@suse.cz>
 <20200929165330.GA11939@dell5510>
X-Mailer: Evolution 3.28.5 (3.28.5-12.el8) 
Mime-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-29_14:2020-09-29,
 2020-09-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0
 spamscore=0 phishscore=0 priorityscore=1501 clxscore=1015 mlxscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009290179
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 0/4] TPM 2.0 fixes in IMA tests
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
 Mimi Zohar <zohar@linux.vnet.ibm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Petr,

On Tue, 2020-09-29 at 18:53 +0200, Petr Vorel wrote:
> Hi Mimi, Lakshmi,
> 
> sorry for late version. FYI Cyril is planning to release LTP tomorrow evening,
> thus To get it into this release require review and testing till tomorrow lunch
> or something.
> Thus understand if you don't have time for it.
> 
> NOTE: crazy support for old versions was important to get support for older SLES
> versions.

Thank you so much for updating the ima_tpm.sh test.  Of all the
comments, it would be nice to re-verify the measurement list with "
--ignore-violations" to provide more context.  Anyone running with just
the ima_policy=tcb, would have violations.  You should be able to test
that yourself with the logs, PCRs, and directions,  I sent you.

In terms of supporting the "ima" template, I think it would only be for
old, existing systems, but then I doubt they would be running ltp.  
The "boot_aggregate" to "sha1" change works on a system with TPM 1.2.

Mimi



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
