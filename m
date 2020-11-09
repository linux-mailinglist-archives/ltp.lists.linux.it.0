Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 751132ABF78
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Nov 2020 16:13:57 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4574F3C537B
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Nov 2020 16:13:57 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 491123C2378
 for <ltp@lists.linux.it>; Mon,  9 Nov 2020 16:13:54 +0100 (CET)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 03A731A006EA
 for <ltp@lists.linux.it>; Mon,  9 Nov 2020 16:13:53 +0100 (CET)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0A9F3FE7056656; Mon, 9 Nov 2020 10:13:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : cc :
 subject : in-reply-to : in-reply-to : references : date : message-id :
 mime-version : content-type; s=pp1;
 bh=Noq3mQ1txiQOKoRjKgyPaazwr+M7jpSHEm/w8JuSMqs=;
 b=jzbwjBTr5elwT/+8SQcP+gNCo5hrXBVETFWtiz4fALwxYHcQzFjj8ekVZnQldqLxP/j4
 Ie9OwJdAUTeGvf9mxFgbgwFkoyBL2W4fhZDB5P0PuC5uOHlQ/tUe9PU0xdBpaId0FTVe
 Yg0ZQLa39D4ANN5rUQ3iTZh59RsEt1La15DBOpR6/0slvyiFIISkMomAp2Q5FLX33zRy
 bxRiTG7k/CD09SyANFmD490Mv/eZhUJVKFNRAgyl0qtgQ5QBbt8+Sgx8WiLdIaCriDUT
 LVomom0XWTCKjUDFM9Gog9CC+xZMHk+WOt+8GNzClQk3v0IBZsw562RQNQl4PU4tsX7Z wQ== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34q74ejmhj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Nov 2020 10:13:51 -0500
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0A9FCU5O025655;
 Mon, 9 Nov 2020 15:13:49 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma06ams.nl.ibm.com with ESMTP id 34njuh25qe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Nov 2020 15:13:49 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0A9FDk4U66912754
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 9 Nov 2020 15:13:46 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ABCBBA405B;
 Mon,  9 Nov 2020 15:13:46 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5F508A4055;
 Mon,  9 Nov 2020 15:13:46 +0000 (GMT)
Received: from oc8242746057.ibm.com (unknown [9.171.3.151])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Mon,  9 Nov 2020 15:13:45 +0000 (GMT)
From: Alexander Egorenkov <egorenar@linux.ibm.com>
To: Cyril Hrubis <chrubis@suse.cz>
In-Reply-To: <20201109150943.GB25892@yuki.lan>
In-Reply-To: 
References: <20201109145657.602251-1-egorenar@linux.ibm.com>
 <20201109150943.GB25892@yuki.lan>
Date: Mon, 09 Nov 2020 16:13:45 +0100
Message-ID: <875z6e5zrq.fsf@oc8242746057.ibm.com>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-09_07:2020-11-05,
 2020-11-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 mlxlogscore=999 phishscore=0 spamscore=0
 impostorscore=0 suspectscore=1 mlxscore=0 adultscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011090102
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/1] lib/tst_virt: support IBM/Z LPAR and z/VM
 virtualization environments
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

Cyril Hrubis <chrubis@suse.cz> writes:

> Hi!
> Actually we can simplify the code like this:
>
> +static int is_ibmz(int virt_type)
> +{
> +	FILE *sysinfo;
> +	char line[64];
> +	int found_lpar, found_zvm;
> +
> +	if (virt_type != VIRT_IBMZ_LPAR && virt_type != VIRT_IBMZ_ZVM)
> +		return 0;

Missed VIRT_IBMZ.

Otherwise is good.
Shall i create a new patch ?

Regards
Alex

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
