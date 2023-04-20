Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 95B216E9BE9
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Apr 2023 20:50:31 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 985E83CBF91
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Apr 2023 20:50:30 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 716FA3C288D
 for <ltp@lists.linux.it>; Thu, 20 Apr 2023 20:50:28 +0200 (CEST)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 6E213600285
 for <ltp@lists.linux.it>; Thu, 20 Apr 2023 20:50:27 +0200 (CEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33KIo15I012299; Thu, 20 Apr 2023 18:50:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : content-type :
 mime-version; s=pp1; bh=Ak9dNIW+ezLdnn06IO9f95uet/E2seV4j4rfiixhQr8=;
 b=DqLRwCR85XBHCMsY96K2FluG3bHn1nMzVKwwvC4SPxI1rfOEVSc6/qXZgx/nYVeVydZK
 09oexonvVwPsxTYcFR4yEBV6mp4zJP7Bx9/xTOFbdeW5H+/FIdDFkuM3sO63kZkr8NRV
 g1zfk726yGeSPj1Psv4v1pdRHouKi7WQaT4VVlLubdXDzRCIV5sWw6DOKqSpSxtqDmJO
 TBjmLYUtLNuYxThTALt6KKyGayTqdMoyl4t90yJI/msiDb+IVtsQ/tV2XZ8C+IZGwC9Q
 ZrgjqEkKRDUwEhdSes8cSkPhxfcdrIeNQz/+HgTqZfEuTSNjX0xaSsttPH8t2KOBwtN4 xg== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3q3asbrjcd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Apr 2023 18:50:25 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 33K1bZJT003566;
 Thu, 20 Apr 2023 18:50:23 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
 by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3pykj6kkfp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Apr 2023 18:50:23 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com
 [10.20.54.106])
 by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 33KIoJvR10224180
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 20 Apr 2023 18:50:20 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D653020040;
 Thu, 20 Apr 2023 18:50:19 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 14FE32004B;
 Thu, 20 Apr 2023 18:50:16 +0000 (GMT)
Received: from tarunpc (unknown [9.43.25.39])
 by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTPS;
 Thu, 20 Apr 2023 18:50:15 +0000 (GMT)
From: Tarun Sahu <tsahu@linux.ibm.com>
To: Cyril Hrubis <chrubis@suse.cz>
In-Reply-To: <ZEECphsAzkd3MRrZ@yuki>
References: <20230419114144.1219505-1-tsahu@linux.ibm.com>
 <ZEECphsAzkd3MRrZ@yuki>
Date: Fri, 21 Apr 2023 00:20:10 +0530
Message-ID: <87wn261j8d.fsf@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: vAxqJ5eTGuPT3U-yLbM7Zp5l3SGlP2LF
X-Proofpoint-ORIG-GUID: vAxqJ5eTGuPT3U-yLbM7Zp5l3SGlP2LF
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-20_15,2023-04-20_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 impostorscore=0 mlxlogscore=907 clxscore=1015 mlxscore=0
 priorityscore=1501 spamscore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2303200000 definitions=main-2304200154
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3] Hugetlb: Test to detect bug with freeing
 gigantic hugetlb pages
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
Cc: piyushs@linux.ibm.com, aneesh.kumar@linux.ibm.com, rpalethorpe@suse.com,
 geetika@linux.ibm.com, jaypatel@linux.ibm.com, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Cyril,

> Hi!
> I've added a .gitignore and runtest entry for the test and pushed,
> (please do not forget about that next time)
Sure, Will keep in mind. Thanks.

~Tarun

> thanks.
>
> -- 
> Cyril Hrubis
> chrubis@suse.cz
>
> -- 
> Mailing list info: https://lists.linux.it/listinfo/ltp

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
