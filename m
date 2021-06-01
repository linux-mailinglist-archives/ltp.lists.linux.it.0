Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A3AE03972F1
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Jun 2021 14:02:59 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6DE353C8014
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Jun 2021 14:02:59 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 39EE23C5596
 for <ltp@lists.linux.it>; Tue,  1 Jun 2021 14:02:58 +0200 (CEST)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 3F2B814000E8
 for <ltp@lists.linux.it>; Tue,  1 Jun 2021 14:02:56 +0200 (CEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 151BYjhD001360; Tue, 1 Jun 2021 08:02:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : cc :
 subject : in-reply-to : in-reply-to : references : date : message-id :
 mime-version : content-type; s=pp1;
 bh=FuMH97fuvl4MlDc5pjAHnJn4n/hQxLyjN+wP13t2cXM=;
 b=HQLzIARr4FK6ddpZmUlBSPfvVQzIIBI8qzaR4g0ypTm/iPhfLx3CQqFcwQiBig5hoYWi
 Qoxi75gKhXPhg1HYItEvDoEjuMK/oYC2sPLHlZN952VuCcMzjdgHqEVoGbNpN1u8u3al
 5Q+EoXid1uyRm0t35haLh2Ec8KVffiJeS6RuaK96JqNTBAO5gSfg/nc50y6d+2V0Kbxn
 qQKQ9zU79Xa0bCskcsObrg9XsrG4AQGV5aetvAoXH8zh7YpCWQClIpMo46NLwSnY9CvW
 ZGddR/o7OnYWO2ZvMQeZfKwmch9oWzYLG68nwbhdQuTWLTDW4C3FWD/DcFEzFIJ1lCpj mA== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38wkg31v3v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Jun 2021 08:02:54 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 151C2nhu022931;
 Tue, 1 Jun 2021 12:02:51 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04ams.nl.ibm.com with ESMTP id 38ud889p3e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Jun 2021 12:02:51 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 151C2nFd29622678
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 1 Jun 2021 12:02:49 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4A8FFA4064;
 Tue,  1 Jun 2021 12:02:49 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2718CA4060;
 Tue,  1 Jun 2021 12:02:49 +0000 (GMT)
Received: from localhost (unknown [9.171.63.112])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  1 Jun 2021 12:02:49 +0000 (GMT)
From: Alexander Egorenkov <egorenar@linux.ibm.com>
To: Cyril Hrubis <chrubis@suse.cz>
In-Reply-To: <YLYVIvTBYsdE6Gzh@yuki>
In-Reply-To: 
References: <20210601093614.245873-1-egorenar@linux.ibm.com>
 <20210601093614.245873-2-egorenar@linux.ibm.com> <YLYVIvTBYsdE6Gzh@yuki>
Date: Tue, 01 Jun 2021 14:02:48 +0200
Message-ID: <875yyxrdw7.fsf@oc8242746057.ibm.com>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 7f1o-wCLLfOJ0pIS7LASo4PKXsyeq_Nh
X-Proofpoint-GUID: 7f1o-wCLLfOJ0pIS7LASo4PKXsyeq_Nh
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-01_06:2021-05-31,
 2021-06-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 mlxscore=0 mlxlogscore=999 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106010078
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] tst_wallclock_restore: fix access time of
 /etc/localtime
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
Cc: , ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>


Hi,

Cyril Hrubis <chrubis@suse.cz> writes:


> I would prefer not to break the test here if the file is not present on
> a system, there may be embedded systems where this file does not exists
> and SAFE_TOUCH() will exit the test with TBROK in that case.

Good point, thanks, fixed in v2.

>
> Also the problem is access time here, so opening and closing the file
> should be enough to fix it right?
>
> What about something as:
>
> 	int fd = open("/etc/localtime", O_RDWR);
> 	if (fd > 0)
> 		SAFE_CLOSE(fd);
>
> That should fix the access time without breaking the test on systems
> that does not have the /etc/localtime file installed.
>

According to some manpage (which i sadly don't remember) the access time of a
file never changes with just an open, one have to read some data at
least. But even reading won't help in this case, see example below
and my explanation in the patch v2.



$ stat /usr/share/zoneinfo/Europe/Berlin
  File: /usr/share/zoneinfo/Europe/Berlin
  Size: 2298            Blocks: 8          IO Block: 4096   regular file
Device: fd01h/64769d    Inode: 2623067     Links: 1
Access: (0644/-rw-r--r--)  Uid: (    0/    root)   Gid: (    0/    root)
Context: system_u:object_r:locale_t:s0
Access: 2038-01-19 04:14:06.076000270 +0100    <---------- !!!
Modify: 2021-06-01 13:48:50.751160745 +0200
Change: 2021-06-01 13:48:50.751160745 +0200
 Birth: 2021-04-28 22:06:08.389017197 +0200

$ od -N1 /usr/share/zoneinfo/Europe/Berlin
0000000 000124
0000001

$ stat /usr/share/zoneinfo/Europe/Berlin
  File: /usr/share/zoneinfo/Europe/Berlin
  Size: 2298            Blocks: 8          IO Block: 4096   regular file
Device: fd01h/64769d    Inode: 2623067     Links: 1
Access: (0644/-rw-r--r--)  Uid: (    0/    root)   Gid: (    0/    root)
Context: system_u:object_r:locale_t:s0
Access: 2038-01-19 04:14:06.076000270 +0100    <---------- !!!
Modify: 2021-06-01 13:48:50.751160745 +0200
Change: 2021-06-01 13:48:50.751160745 +0200
 Birth: 2021-04-28 22:06:08.389017197 +0200


Thanks for feedback
Regards
Alex

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
