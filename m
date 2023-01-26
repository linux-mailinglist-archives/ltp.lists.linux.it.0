Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 718C667D9B6
	for <lists+linux-ltp@lfdr.de>; Fri, 27 Jan 2023 00:38:33 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3D19A3CD351
	for <lists+linux-ltp@lfdr.de>; Fri, 27 Jan 2023 00:38:33 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 5BD223CB83D
 for <ltp@lists.linux.it>; Fri, 27 Jan 2023 00:38:29 +0100 (CET)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 9A84F601392
 for <ltp@lists.linux.it>; Fri, 27 Jan 2023 00:38:28 +0100 (CET)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30QMrffl005095; Thu, 26 Jan 2023 23:38:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : content-type :
 mime-version; s=pp1; bh=ZX+IBfaTL+lAOP5EsztnmXB0ClMBdSnL++rIugJVh2U=;
 b=JhTtxwnx8sDRvK9q3yMOqiggNwPrrXwMT1UDY/DTebxPwKrXgP+9mIYQmy3RbY+Jd6Ke
 eclmPmEn/N7TCoW6KSgOUmIsbT4/V+C3gmzGFSz32TMXmjXpppNqREa3xxXMtgRl6Jiv
 ufVkrVKXNST+l5stxVjwtrYfs3kDNmqHa5FXd9qaWjhRP11hDJgCQ/xWS0oRyKl6bSk+
 DdKf8WUq1YYE2+dcJDy0uC71plAdSD6OHwOHzjJfHDVVWnwFamvWKMtHM9jFpYbZX0CT
 HGHQGd4P4MY4JGYPJKOYr+Z8Xsy7rO1iTgl1uJNACXZU4uBUKUNlfk/aHTMQSYLgdSrg FQ== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nc2qcgspp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Jan 2023 23:38:26 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30Q5rJaU013377;
 Thu, 26 Jan 2023 23:38:23 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
 by ppma03fra.de.ibm.com (PPS) with ESMTPS id 3n87p6cxc9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Jan 2023 23:38:23 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com
 [10.20.54.106])
 by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 30QNcKL637093804
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 26 Jan 2023 23:38:20 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BB35420043;
 Thu, 26 Jan 2023 23:38:20 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9723820040;
 Thu, 26 Jan 2023 23:38:19 +0000 (GMT)
Received: from tarunpc (unknown [9.43.26.43])
 by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTPS;
 Thu, 26 Jan 2023 23:38:19 +0000 (GMT)
From: Tarun Sahu <tsahu@linux.ibm.com>
To: Petr Vorel <pvorel@suse.cz>
In-Reply-To: <Y9MGHKXel5kjwoTT@pevik>
References: <20230125222703.19943-1-pvorel@suse.cz>
 <20230125222703.19943-2-pvorel@suse.cz> <87edrh0zy2.fsf@linux.ibm.com>
 <Y9MGHKXel5kjwoTT@pevik>
Date: Fri, 27 Jan 2023 05:08:17 +0530
Message-ID: <87sffwq32u.fsf@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: VFO-X3ZYwl91xB_CmhcqkzDTio3_j3Mf
X-Proofpoint-ORIG-GUID: VFO-X3ZYwl91xB_CmhcqkzDTio3_j3Mf
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-26_09,2023-01-26_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015
 impostorscore=0 mlxscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 mlxlogscore=894 phishscore=0 spamscore=0 priorityscore=1501 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301260220
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] hugemmap15: Compile with -O
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
Cc: Richard Palethorpe <rpalethorpe@suse.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Petr Vorel <pvorel@suse.cz> writes:

> Hi Tarun,
>
>> Hi Petr, Cyril, all
>
>> Though It already got merged, please note this,
> FYI this has not been merged (only the second patch "hugemmap15: Use
> TST_TEST_TCONF() for unsupported archs", which was needed to fix compilations).

Ok.
>
>> IIRC, I specifically turned off optimization for hugemmap15
>> because of clang compiler issue, it behaves weirdly with clang
>> without -O0 and test fails on the system.
>
> Isn't -O the same as -O0 ?
I think -O is -O1.

I tested with clang with -O, it fails. So yeah it is not turning off
relevant optimization.

>
> Kind regards,
> Petr
>
> -- 
> Mailing list info: https://lists.linux.it/listinfo/ltp

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
